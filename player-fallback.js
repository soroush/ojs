// Fallback depends on Flowplayer and the Flowplayer audio plugin
//
// References
// ----------
// http://diveintohtml5.org/everything.html

function audioPlayer(id, file) {
    // TODO: Test to make sure the required JS libraries are available

    // Provide window.console if the browser doesn't. In this case messages
    // will just go to the bitbucket.
    if (!window.console) {
        console = {};
        console.log = {};
    }

    console.log('JavaScript is available.');

    if (!!document.createElement('audio').canPlayTypeFOO) {
        // HTML5 <audio> is supported
        console.log('HTML5 <audio> *is* supported.');

        // Firefox and Opera don't respect the audio "loop" parameter, so we
        // add an event handler in JS to handle looping.
        var player = document.getElementById(id);
        if (player.addEventListener != undefined) {
            player.addEventListener('ended', function() {
                                        this.currentTime = 0;
                                    }, false);
        }
    }
    else {
        // HTML5 <audio> is not supported
        console.log('HTML5 <audio> *is not* supported.');

        if (swfobject.hasFlashPlayerVersion('9.0')) {
            // Flash is installed. Try to install Flowplayer.
            console.log('Flash >= 9.0 is installed. Try to install FlowPlayer');

            $('#' + id).replaceWith(
                '<div id="' + id + '" style="width: 400px; height: 30px;"></div>');

            flowplayer(id, "flowplayer/flowplayer-3.2.7.swf", {
                           clip: {
                               onBeforeFinish: function() { return false; },
                               url: file
                           },
                           plugins: {
                               controls: {
                                   autoHide: { enabled: false },
                                   fullscreen: false
                               }}});
        }
        else {
            // TODO: Handle no flash
            console.log('Flash >= 9.0 is not available.');
        }
    }
}
