# Firefox
We can heavily customise Firefox as we please.

## user.js [TODO!]
Modified from Arkenfox, please see a reference user.js created.

We try to keep the window size to standard as much as is possible. This also
includes the size of the sidebar, which is done in `chrome/userChrome.css` instead.

### System-wide user.js
Sources: https://wiki.archlinux.org/title/Firefox#Settings_storage and
https://support.mozilla.org/en-US/kb/customizing-firefox-using-autoconfig
1. Create ``/usr/lib/firefox/defaults/pref/autoconfig.js`:
```js
pref("general.config.filename", "firefox.cfg");
pref("general.config.obscure_value", 0);
```

2. Create `/usr/lib/firefox/firefox.cfg` (this stores the actual configuration):
```js
//
//...your settings...
// e.g to disable Pocket, uncomment the following lines
// lockPref("extensions.pocket.enabled", false);
// lockPref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
```
Please note that the first line must contain exactly //. The syntax of the file is similar to that of user.js.

## chrome/
Here, we can force a fix width of the side bar in `chrome/userChrome.css`.
```css
#sidebar-box {
	max-width: 300px !important;
	min-width: 300px !important;
	width: 300px !important;
}
```

We can change the new tab image here in `chrome/userContent.css`.
```css
@-moz-document url("about:newtab"), url("about:privatebrowsing") {
   body {
     background-image: url("wallpapers/image.jpg") !important;
     background-size: cover !important;
     background-repeat: no-repeat !important;
     background-attachment: fixed !important;
     background-position-x: center !important;
     background-position-y: bottom !important;
  }
}
```
Change the URL as necessary.

## Addons and Extensions
[Mozilla Github](https://github.com/mozilla/policy-templates)
[Policy Templates reference](https://mozilla.github.io/policy-templates/)
[Outdated Globals Installation](https://kb.mozillazine.org/Installing_extensions)
The [install
directory](https://www.reddit.com/r/firefox/comments/gnv59x/comment/frbzy4r/)
is as given by `Application binary` in `about:support`. In the case of
ArchLinux, this should be `/usr/lib/firefox/firefox`. Then, the distributions
folder would be `../distributions/`. Similar to `user.js` currently, we keep an
active copy of `policies.json` for handling Extensions (for now) to ensure an
identical base of extensions for all profiles.

An example:
```json
{
  "policies": {
    "ExtensionSettings": {
      "uBlock0@raymondhill.net": {
        "installation_mode": "force_installed",
        "install_url": "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi"
      },
      "{446900e4-71c2-419f-a6a7-df9c091e268b}": {
        "installation_mode": "normal_installed",
        "install_url": "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi"
      }
    }
  }
}
```
The key to the extension can be found in `about:support`. The [url for
downloading](https://stackoverflow.com/questions/55496793/how-to-get-the-link-to-the-latest-version-of-firefox-addon)
has the name as given via the key name found in the url, such as
`https://addons.mozilla.org/en-US/firefox/addon/tree-style-tab/`.
