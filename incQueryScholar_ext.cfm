<cfquery name="Sessions" datasource="#APPLICATION.dsn#">
	SELECT DISTINCT
		a.ActivityTypeID,
		a.Title,
		u.Unit,
		s.QuarterID,
		Coalesce(ql.Quarter, '&nbsp;') AS Quarter,
		s.SessionDateTime,
		--Coalesce(dbo.build_sc_types(A.ScholCommTypes), '&nbsp;') AS Topics,
		Case
			When len(dbo.build_sc_types(A.ScholCommTypes)) <> 0 Then dbo.build_sc_types(A.ScholCommTypes)
			Else '&nbsp;'
		End AS Topics,
		Case
			When len(dbo.build_delivery_modes(A.DeliveryModes)) <> 0 Then dbo.build_delivery_modes(A.DeliveryModes)
			Else '&nbsp;'
		End AS Modes,
		Convert(varchar, s.SessionDateTime, 101) AS StyledSessionDateTime,
		dbo.get_librarians_by_activity(a.ActivityID) AS Librarian,
		dbo.get_presenters_by_session(s.SessionID) AS CoLibs,
		Coalesce(dl.Department, 'N/A') AS Department,
		dbo.total_sessions(s.SessionID) AS Sessions,
		dbo.count_attendees_by_session(s.SessionID) AS People,
		Coalesce(dbo.total_duration(s.SessionID), 0) AS Duration,
		dbo.get_display_time((Coalesce(dbo.total_duration(s.SessionID), 0))) AS display_dur,
		Coalesce(dbo.total_prep_time(s.SessionID), 0) AS PrepTime,
		dbo.get_display_time((Coalesce(dbo.total_prep_time(s.SessionID), 0))) AS display_prep
	FROM
		dbo.Activity a
		JOIN dbo.SessionActivity sa ON a.ActivityID = sa.ActivityID
		JOIN dbo.Session s ON sa.SessionID = s.SessionID
		LEFT JOIN dbo.SessionLibrarian sl ON s.SessionID = sl.SessionID AND s.CreatedBy = sl.LibrarianID
		LEFT JOIN dbo.UnitLookup u ON sl.UnitID = u.UnitID
		LEFT JOIN dbo.SessionContact sco ON s.SessionID = sco.SessionID
		LEFT JOIN dbo.SessionClassroom scl ON s.SessionID = scl.SessionID
		LEFT JOIN dbo.ActivityMaterial am ON a.ActivityID = am.ActivityID
		LEFT JOIN dbo.Material m ON am.MaterialID = m.MaterialID
		LEFT JOIN dbo.Contact c ON sco.ContactID = c.ContactID
		LEFT JOIN dbo.QuarterLookup ql ON s.QuarterID = ql.QuarterID
		LEFT JOIN dbo.DepartmentLookup dl ON s.DepartmentID = dl.DepartmentID
	WHERE
		--a.ActivityTypeID = #type# AND
		s.ScholarlyCommunication = 1
		AND
		(
			(Datepart(Year, s.SessionDateTime) = 2009 AND Datepart(Month, s.SessionDateTime) BETWEEN 7 AND 12)
			 OR (Datepart(Year, s.SessionDateTime) = 2010 AND Datepart(Month, s.SessionDateTime) BETWEEN 1 AND 6)
		)
	ORDER BY
		a.ActivityTypeID,
		s.QuarterID,
		u.Unit,
		a.Title,
		s.SessionDateTime
</cfquery>
