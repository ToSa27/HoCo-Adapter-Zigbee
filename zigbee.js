const EventEmitter = require('events');
const util = require('util');
const log = require("../common/log.js");
const zigbee = require('cc-znp');

function Zigbee(config) {
	log.debug("zigbee config: " + JSON.stringify(config));
	EventEmitter.call(this);
	var self = this;
	this.config = config;
	this.connected = false;

	zigbee.on('ready', function () {
		log.debug("zigbee driver ready");
		self.id = "???";
		self.connected = true;
		self.emit("connected", self, self.id);
	});

	zigbee.init({
		path: '/dev/ttyUSB0',
		options: {
			baudrate: 115200,
			rtscts: true
		}
	}, function (err) {
		if (err) {
			self.connected = false;
			self.emit("disconnected", self);
		}
	});
};

util.inherits(Zigbee, EventEmitter)

Zigbee.prototype.adapter = function(command, message) {
	switch (command) {
		case "learn":
//			zigbee.addNode(this.id, true);
			break;
	}
};

Zigbee.prototype.node = function(nodeid, command, message) {
}

Zigbee.prototype.parameter = function(nodeid, parameterid, command, message) {
}

module.exports = Zigbee;
