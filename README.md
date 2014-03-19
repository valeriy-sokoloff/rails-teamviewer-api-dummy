Teamviewer API Rails Dummy App
=========

main file: lib/teamviewer.rb

Usage
---

* Teamviewer::Connector.new returns oauth 'client' object,
* and we use it for getting access token and needed extra information,
* ...which we use directly in wrapper:
* `client = Teamviewer::Client.new( client_obj, access_token_str )`
* and than simply do whatever we want:
* `client.meetings #return meetengs list`
* `client.meeting_add( {instant: true} ) #creates new instant meeting` etc.
