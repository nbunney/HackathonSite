window.grab = (function() {
  let token = document.querySelector('meta[name=csrf-token]');
  let param = document.querySelector('meta[name=csrf-param]');

  function status (response) {
    if (response.ok) {
      return Promise.resolve(response);
    } else {
      var error = new Error(response.statusText || response.status);
      error.status = response.status;
      error.response = response;
      return Promise.reject(error);
    }
  }

  function headers (options = {}) {
    options.headers = options.headers || {};
    options.headers['X-Requested-With'] = 'XMLHttpRequest';
    return options;
  }

  function json (response) {
    return response.json();
  }

  function grab (url, options) {
    options = headers(options);
    return fetch(url, options).then(status);
  }

  grab.json = function (url, options) {
    options = headers(options);
    options.headers['Accept'] = 'application/json';
    return fetch(url, options).then(status).then(json);
  }

  grab.poll = function (url, options) {
    return new Promise(function (resolve, reject) {
      function poll (wait) {
        function done (response) {
          switch (response.status) {
            case 200:
              resolve(response);
              break;
            case 202:
              setTimeout(poll, wait, wait * 1.5);
              break;
            default:
              var error = new Error(response.statusText || response.status);
              error.response = response;
              reject(error);
              break;
          }
        }
        $.fetch(url, options).then(done, reject);
      }
      poll(1000);
    })
  }

  return grab;
})();
