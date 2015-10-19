var Promise = require('bluebird');
var fs = Promise.promisifyAll(require('fs'));
fs.mvAsync = Promise.promisify(require('mv'));
var path = require('path');

var settings = {};

var downloadPath = fs.realpathSync(path.join(process.env['USERPROFILE'] || process.env['HOME'], 'Downloads'));
var oneDrivePath = fs.realpathSync(path.join(process.env['USERPROFILE'] || process.env['HOME'], 'OneDrive'));

function initSettings() {
	return new Promise(function (resolve, reject) {
		try {
			var localSettings = require(path.join(__dirname, 'settings.json'));
			resolve(settings = localSettings);
		} catch (error) {
			settings = {};
			reject(error);
		}
	});
}

function fetchTorrents() {
	return fs.readdirAsync(downloadPath).filter(function getTorrentFiles(item) {
		return item.match(/[^\.]\.torrent.*/);
	}).map(function rename(file) {
		var newName = [file, 'torrent'].join('.');
		return fs.mvAsync(path.join(downloadPath, file), path.join(oneDrivePath, newName)).then(function () { return newName; });
	});
}

initSettings().then(fetchTorrents);