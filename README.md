Contact Printer
===============

This is your personnal assistant. You tell him who is important to you, and he
will make sure you always have the latest contact infos about them. Printed on
paper.

how it works
------------

Say you have a directory full of *<contact-name>.md* files in it.  
These files should be formatted like the following:

    Sponge Bobe Square Pants
    ========================

    Phones
    ------
    * 819-555-2020 (at his pineapple house)
    * 819-555-1234 (his cellphone)

    Emails
    ------
    * spongebob@hotmail.com
    * spongy@aol.com

In this same directory, create a file called `contact_printer.yml` that is formatted like the following:

    contacts:
    - sponge-bob-square-pants
    - totoro
    - the-yamadas
    - catbus

All these contacts should exist in your contacts directory, named like
`totoro.md`.

Now, tell `print_contacts` command-line script where this 'contacts' directory is located
by calling him like this:

    $ print_contacts /path/to/my/contacts/

That's it!

Installation
------------

If i got your attention this far, it's a miracle. The following is pretty easy.

1. Clone the repository: `$ git clone git://github.com/juliend2/contact_printer.git`
2. `cd contact_printer` then `rake install`

Limitations
-----------

* Currently, it only shows the contact's email addresses and phone numbers
  along with their name, though, you can add more kinds of informations into your contact files


