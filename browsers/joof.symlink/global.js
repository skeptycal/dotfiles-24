// Let's me scroll by half a page instead of a whole page (space bar)
// Bound to ctrl+d and ctrl+u -- like in vim
setupScrollByCtrlDAndU();

// Speed up any <video> by shift-clicking on it
// Every click bumps the speed by .25 until it resets
//   eg. 1 -> 1.25 -> 1.5 -> 1
setupVideoSpeedThing();

// Remove weird fonts and font-widths from unreadably sites with ctrl-alt-s
setupSystemFontResetter();

// TODO
setupVideoZoom();

function setupVideoZoom() {
  document.addEventListener("mouseup", event => {
    if (!event.altKey || event.shiftKey || event.ctrlKey || event.metaKey)
      return;

    const video = findCorrespondingVideoElement(event);
    if (!video) return;

    console.log(video);
  });
}

function setupVideoSpeedThing() {
  document.addEventListener("mouseup", event => {
    if (!event.shiftKey || event.ctrlKey || event.metaKey) return;

    const video = findCorrespondingVideoElement(event);
    if (!video) return;

    event.preventDefault();

    switch (video.playbackRate) {
      case 1:
        video.playbackRate = 1.25;
        break;
      case 1.25:
        video.playbackRate = 1.5;
        break;
      default:
        video.playbackRate = 1;
        break;
    }

    console.log(
      `%cplayback rate set to ${video.playbackRate}`,
      "color: purple"
    );
  });
}

function setupScrollByCtrlDAndU() {
  document.addEventListener("keydown", event => {
    if (!onlyCtrl(event)) return;

    if (event.keyCode === 68) return scroll("down");
    if (event.keyCode === 85) return scroll("up");
  });

  function scroll(direction) {
    const distance = window.innerHeight / 10 * 5;

    let dest;
    if (direction === "up") {
      dest = window.scrollY - distance;
    } else {
      dest = window.scrollY + distance;
    }

    let start = window.scrollY;
    let change = dest - start;
    let currentTime = 0;
    const increment = 20;
    const duration = 150;

    function tick() {
      currentTime += increment;
      const pos = currentTime / duration;

      document.scrollingElement.scrollTo(
        0,
        start + change * EasingFunctions.easeOutQuad(pos)
      );

      if (currentTime < duration) {
        requestAnimationFrame(tick);
      }
    }

    tick();
  }

  function onlyCtrl(event) {
    return event.ctrlKey && !event.shiftKey && !event.metaKey;
  }
}

function setupSystemFontResetter() {
  document.addEventListener("keyup", event => {
    if (event.keyCode === 83 && event.ctrlKey && event.altKey) {
      const s = document.createElement("style");
      s.innerHTML = `
        * {
          font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", sans-serif !important;
        }
        p {
          font-weight: 400 !important;
          max-width: 40rem;
          line-height: 1.5;
        }`;
      document.body.appendChild(s);
    }
  });
}

EasingFunctions = {
  // no easing, no acceleration
  linear: function(t) {
    return t;
  },
  // accelerating from zero velocity
  easeInQuad: function(t) {
    return t * t;
  },
  // decelerating to zero velocity
  easeOutQuad: function(t) {
    return t * (2 - t);
  },
  // acceleration until halfway, then deceleration
  easeInOutQuad: function(t) {
    return t < 0.5 ? 2 * t * t : -1 + (4 - 2 * t) * t;
  },
  // accelerating from zero velocity
  easeInCubic: function(t) {
    return t * t * t;
  },
  // decelerating to zero velocity
  easeOutCubic: function(t) {
    return --t * t * t + 1;
  },
  // acceleration until halfway, then deceleration
  easeInOutCubic: function(t) {
    return t < 0.5 ? 4 * t * t * t : (t - 1) * (2 * t - 2) * (2 * t - 2) + 1;
  },
  // accelerating from zero velocity
  easeInQuart: function(t) {
    return t * t * t * t;
  },
  // decelerating to zero velocity
  easeOutQuart: function(t) {
    return 1 - --t * t * t * t;
  },
  // acceleration until halfway, then deceleration
  easeInOutQuart: function(t) {
    return t < 0.5 ? 8 * t * t * t * t : 1 - 8 * --t * t * t * t;
  },
  // accelerating from zero velocity
  easeInQuint: function(t) {
    return t * t * t * t * t;
  },
  // decelerating to zero velocity
  easeOutQuint: function(t) {
    return 1 + --t * t * t * t * t;
  },
  // acceleration until halfway, then deceleration
  easeInOutQuint: function(t) {
    return t < 0.5 ? 16 * t * t * t * t * t : 1 + 16 * --t * t * t * t * t;
  }
};

function vimeoVideo(event) {
  return event.target.ownerDocument.querySelector(".video video");
}

function findCorrespondingVideoElement(event) {
  if (event.target.tagName === "VIDEO") return event.target;

  const vimeo = vimeoVideo(event);
  if (vimeo) return vimeo;

  return undefined;
}
