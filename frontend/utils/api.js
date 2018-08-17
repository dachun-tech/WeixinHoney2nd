function n(n) {
    return Object.keys(n).map(function(e) {
        return encodeURIComponent(e) + "=" + encodeURIComponent(n[e]);
    }).join("&");
}

module.exports = {
    getTopicByID: function(e, o) {
        return "https://cnodejs.org/api/v1/topic/" + e + "?" + n(o);
    }
};