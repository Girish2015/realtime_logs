App.logChannel = App.cable.subscriptions.create({
  channel: "LogChannel",
  room: "log"
}, {
  received: function(data) {
    console.log(data);
    return this.appendLine(data);
  },
  appendLine: function(data) {
    var html;
    html = this.createLine(data);
    return $("#realtime_logs").append(html);
  },
  createLine: function(data) {
    return "<p>" + data.message + "</p>";
  }
});

// App.logChannel.send({ sent_by: "Paul", body: "This is a cool chat app." });