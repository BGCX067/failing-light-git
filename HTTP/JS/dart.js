if (navigator.webkitStartDart) {
    if (!navigator.webkitStartDart()) {
        document.body.innerHTML = 'This build has expired.  Please download a new Dartium at http://www.dartlang.org/dartium/index.html';
    }
} else {
    //TODO: Figure out a way to optimize this so DART/*.dart can be replaced with JS/*.js before *.dart has been fetched from the server.
    window.addEventListener("DOMContentLoaded", function (e) {
        var scripts = document.getElementsByTagName("script");
        var length = scripts.length;
        for (var i = 0; i < length; ++i) {
            if (scripts[i].type == "application/dart") {
                if (scripts[i].src && scripts[i].src != '') {
                    var script = document.createElement('script');
                    script.type = "text/javascript";
                    script.src = scripts[i].src.replace(/dart/g, "js");
                    script.src = script.src.replace(/DART/g, "JS");
                    var parent = scripts[i].parentNode;
                    document.currentScript = script;
                    parent.replaceChild(script, scripts[i]);
                }
            }
        }
    }, false);
}