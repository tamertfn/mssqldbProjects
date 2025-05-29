CREATE TRIGGER DDL_SchemaChange_Trigger
ON DATABASE
FOR DDL_DATABASE_LEVEL_EVENTS
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO SchemaChangeLog (
        EventType,
        ObjectName,
        DatabaseName,
        SchemaName,
        LoginName,
        DDLCommand
    )
    VALUES (
        EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(100)'),
        EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'varchar(255)'),
        EVENTDATA().value('(/EVENT_INSTANCE/DatabaseName)[1]', 'varchar(100)'),
        EVENTDATA().value('(/EVENT_INSTANCE/SchemaName)[1]', 'varchar(100)'),
        EVENTDATA().value('(/EVENT_INSTANCE/LoginName)[1]', 'varchar(100)'),
        EVENTDATA()
    );
END;
