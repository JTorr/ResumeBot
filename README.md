[![Code Climate](https://codeclimate.com/github/JTorr/ResumeBot/badges/gpa.svg)](https://codeclimate.com/github/JTorr/ResumeBot)

ResumeBot README
======

What is It?
---------------

No one has time to customize a resume to 100 different job postings,
but one-size-fits-all resumes quickly end up in the waste bin.

ResumeBot allows users to create a Master resume, which is a comprehensive list
of all experience, skills and education. The user then cherry-picks the relevant
pieces to create a custom resume in under a minute.

In the future, users will be able to associate resume versions with job listings,
comparing the keywords present in each. This will help users identify information
that should be added or deleted.

How Do I Use It?
----------------
ResumeBot is live at http://resume-bot.herokuapp.com/.
(Be patient, as it will take about 30 seconds to load.)

1. Click "Profile Options", then "Sign Up".
2. Create your Master resume. This should be a comprehensive list of all experience,
skills and education.
3. Click "Create New Resume", give it a title, and choose the info you want to include.
4. Click "Create Resume", and you will see the HTML version of your resume.
5. Click "Download PDF" to download a printable version.

Please Note: This app is currently in demo status (which, in practical terms,
  means everybody has the title "Robot Coder Ninja", plus a few other quirks.)


Installation
----------------
First, clone the project:

```
git clone https://github.com/JTorr/ResumeBot.git
```

Go into the directory where it is installed, and bundle:

```
cd resume_bot
bundle install
```

Then set up the database:

Note: You will need Postgres installed on your computer to run this app.

```
rake db:setup
```

Running the Application:
----------------

```
rails s
```

Future Development
----

Features planned for future development:

* Add some tests (No, really! Why are you laughing?)
* Job search feature: Using the CareerBuilder API, search for job postings,
associate jobs with resumes, and compare them based on keywords.
* Allow users to customize photo and title (because apparently some people don't
want to be a Robot Coder Ninja)
* Add additional HTML & PDF formats for resumes


All bugs, feature requests, pull requests, feedback, etc., are welcome.
