# Environmentalist

Environmentalist is a tool for working with `.env` files on a projects.

We often follow the convention of putting all the necessary ENV keys in a
`.sample.env` file that is checked into version control. Along with this, we run
a setup script that usually copies over a `.env` file. This file is not checked
into version control. This allows us to make sure we do not store sensitive data
in version control.

The problem with this setup comes along when a teammate adds a new key to the
`.sample.env` file. We run into a situation where a person on the project may
not realize this has been added and ends up having to track the line down by
hand and move it over. This is where environmentalist comes in!

### Primary Function

When you run the environmentalist command, with no options, environmentalist
will copy any keys from the `.sample.env` file in the current directory to the
`.env` file.

You may also specify a file for the sample file as the first argument to the
command and a second file as the file to use as your actual env file.
