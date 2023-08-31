    Object.defineProperty(window.navigator, 'userAgent', {
      get: function () { return 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/80.0.3987.163 Chrome/80.0.3987.163 Safari/537.36'; }
    });

    var domain = "meet.cyon.tools";
    var options = {
      roomName: "desaster",
      //width: 100%,
      //height: 100%,
      parentNode: document.querySelector('#meet'),
      userInfo: {
        //email: 'email@jitsiexamplemail.com',
        displayName: 'desaster'
      },
      configOverwrite: {
          prejoinPageEnabled: false,
          startWithAudioMuted: false,
          startWithVideoMuted: false,
          welcomePage: {
            // Whether to disable welcome page. In case it's disabled a random room
            // will be joined when no room is specified.
            disabled: true
            // If set,landing page will redirect to this URL.
            // customUrl: ''
          },
          defaultLocalDisplayName: 'desaster',
          defaultRemoteDisplayName: 'desaster',
	  readOnlyName: true,
          requireDisplayName: false,
	  p2p: {
            enabled: true
          }
      },
      interfaceConfigOverwrite: {
        filmStripOnly: true
      }
    }
