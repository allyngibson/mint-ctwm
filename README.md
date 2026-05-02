# CTWM – Strange New Worlds

*What would Linux Mint have looked like in 1994?*

In 2023 and 2024, I cobbled together a CTWM configuration that melded the visual stylings of early 1990s X11 workstations with the aesthetics of modern Linux Mint (which I like) and workflows. The result is something that is both vintage and up-to-date.

Though I had tinkered with Linux off and on over the years, beginning with 2008's Ubuntu 8.04, it took the COVID pandemic and a work-from-home mandate to make Linux part of my daily routine.  I gained more confidence with Linux Mint, I did more and more of my daily work in it, and I reached a point where I wanted to do something *fun* beyond Mint's Cinnamon desktop.  I saw people doing interesting things with their desktop interfaces in Reddit's r/unixporn, so I experimented.  I tried i3.  I tried WindowMaker, which recreated the NeXTStep aesthetic, and I enjoyed the retro look of it.

Eventually, I found my way to CTWM, an old window manager -- the default configuration file in the Debian package dates to 1991! -- that predates Linux itself.  I read about it, I looked at screenshots.  It felt like the sort of thing I would have read about in an issue of *BYTE* as a teenager in the early 90s, and if I'd had the computing power at the time, it was the sort of thing I would have used.

I found the window manager I was looking for.  And I had a strong idea of what I wanted to do with it.

The reason I use Mint, besides that it does what I need it to do, is the *aesthetics*.  I wanted to meld the aesthetics of Mint with the old school feel of one of the early X11 window managers.  I wanted to build an environment that had chunky borders, corners so sharp you could cut yourself, and the Mint-Y dark color scheme.

In fits and starts, experiments and rewrites, I built what I envisioned, a working environment that is at once minimalist, old school, and modern.

This repository is the mature configuration.  There were dead-ends.  Ideas that didn't work.  Things I made harder than they needed to be.

Take, for example, CTWM's Workspace Manager.  In my design, there's a side panel, and there I have 8 or 10 workspaces, with a map of the applications open in each workspace.  My original idea?  Use the Workspace Manager to recreate the Cinnamon Workspace Expo View, where one hits Ctrl-Alt-Up and up pops an overview of all the workspaces.  What I found was this kept the workspaces tucked out of sight, and as the saying goes, "out of sight, out of mind."

Some configurations I looked at simply dropped the Workspace Manager into a window right on the screen, like it was another app.  I realized, eventually, that I could do that, too, keep the Workspace Manager on the screen at all times, but I could build something like a panel around it, style it in the configurations to keep the borders simple and unobtrusive, and make it part of my workflow.  How?  Through settings in the .ctwmrc file or strategic use of the `wmctrl` command, I could deploy apps to specific workspaces when they launched.  This is a behavior that a tiling window manager like i3 makes use of.  I could make use of it here, too, and build a system where LibreOffice always opens in one workspace, the Vivaldi browser opens in another, and the Microsoft Teams progressive web app opens in yet another.  One thing I really like about the Workspace Manager is the drag-and-drop-ability; I can drag an open window from one workspace to another from the Workspace Manager.  It's a cool feature, and it's right here on my screen.

Window buttons went through several configurations.  First, I made .xpm files of the Cinnamon window buttons.  I decided I didn't like those, and then I made .xpm files of buttons that were color coded for minimize, maximize, and close.  I didn't like that, either, and I decided I wanted my window buttons and their organization to be as Motif-like as possible.  Those buttons were built into CTWM natively, but I made a larger "box" button for maximizing a window to make it more Motif-like.

I experimented with on-screen icons.  I didn't know if I would like it until I saw it in action, and when I did, I knew I didn't like it.  The ability to minimize a window went away.

Even the menus went through evolution.  First I hand-coded a CTWM equivalent of the native Cinnamon menu, leaving out applications that required root privileges, as CTWM won't launch an authorization input in the GUI.  Later, I tried a menu based on the classic GNOME/MATE Applications/Places/System menu because I felt it would be better organized.  It may have been organized, but it also put the applications I wanted another menu level further down.  Ultimately, I decided to try a stripped-back, minimalist menu.  Not a lot of applications, with the important ones right on the root menu, and updating the code as needs arise.

I also investigated tiling.  CTWM doesn't tile like i3, but I could *create* a manual tiling system with `wmctrl`.  There's a menu that will resize a window and place it top left or bottom right, left half or bottom half, so I can have a tiled layout if I wish.  (To be honest, this is a rarely used feature, but I'm proud of it.)

I spent time on keybinds.  I coded keybinds to recreate as many of the Cinnamon keybinds as I could.  I also liked the i3 workspace keybinds, like Meta-3 to switch to workspace 3 or Shift-Meta-5 to move the active window to workspace 5, so I implemented these in my CTWM configuration as well.  I also implemented the i3 workspace keybinds in Cinnamon, and there is a bash script in the .local/bin filder, `cinn-ie-keybinds`, which will implement them in the Cinnamon desktop instead of hand-coding them.

Even the basic structure of the configuration went through several iterations.  First, I built directly from the default .ctwmrc configuration that came with the Debian package.  A few months later, when I had more time, I took the structured theme on the official CTWM website and restructured my configuration along its lines.  Finally, I cut out the things I didn't need.

A lot of ideas went into this, as did thinking, experimentation, and refinement.  I have the retro X11 style I'd have read about in *BYTE* aeons ago, a workflow that can be keyboard- or mouse-driven in a modern style, and an aesthetic style that matches what I like about Linux Mint.

It also makes heavy use of the `.Xresources` file, to style X11 apps to match the Mint-Y-Dark-Teal color scheme.

If Mint existed in 1994, it probably would have looked a lot like this.

## Installation

Drop the files into your home directory and the appropriate subfolders.  `install.sh` installs the CTWM desktop and a couple of programs the configuration depends upon, like `wmctrl` and `xscreensaver`.  It also writes a symbolic link, connecting `.xinitrc` (which Mint does not use) to `.xsession` (which Mint can use).  I use a `.xinitrc` because that's how it would have been done in 1994.  It's the file that `xstart` would have looked for.

## Launching CTWM

Installing CTWM will add CTWM to the list of desktop environments to choose from at login.

Unfortunately, launching CTWM this way will *not* load the panel correctly.  You will have the Workspace Manager, but not the panel (which includes `xclock` and `xeyes`, the latter of which I find helpful due to some vision issues).

Instead, use the Default Xsession, which will load the `xsession` file, then launch CTWM.

Alternatively, create a bash script with the contents of `.xinitrc`, make it executable, and edit the **Exec** line in `/usr/share/xsessions/ctwm.desktop` to call that bash script instead of the `ctwm` executable.

## Final Thoughts

It's a cool little system.  This system isn't for everyone -- I don't even use it all the time, just a few times a week -- but creating it was a lot of fun, and I learned things I didn't know before.  There might be an idea or three here that you can use for your own projects.

Ultimately, why did I do it?  Because, as Captain James Tiberius Kirk said of freeclimbing El Capitan, "Because it's there."
