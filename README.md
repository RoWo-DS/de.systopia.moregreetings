# CiviCRM Extension for additional greetings: More Greetings(XCM)

## Features
- Provides up to 9 additional contact greeting fields
- Allows to configure rules for the creation of greetings using SMARTY-based logic on the data already in CiviCRM
- Gives the option to update added greeting fields for all contacts in the database

## Documentation
- EN: https://docs.civicrm.org/moregreetings/en/latest (automatic publishing)
- DE: https://docs.civicrm.org/moregreetings/de/latest (automatic publishing)

## Known Issues

With recent CiviCRM versions APIv3 doesn't return some fields for contacts like
`email_greeting_display` which might lead to empty placeholders. This is
resolved in version 1.2-beta3 or later of this extension.
