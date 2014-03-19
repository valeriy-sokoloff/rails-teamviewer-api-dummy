Teamviewer API Rails Dummy App
=========

main file: lib/teamviewer.rb

Usage
---

* `conn = Teamviewer::Connector.new` returns connection object,
* ...where we can find 'oauth client' - `conn.client`.
* Next we use it for getting access token and needed extra information,
* ...which we use directly in wrapper:
* `client = Teamviewer::Client.new( oauth_client_obj, access_token_str )`
* and than simply do whatever we want:
* `client.meetings #return meetengs list`
* `client.meeting_add( {instant: true} ) #creates new instant meeting` etc.
