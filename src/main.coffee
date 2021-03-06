callMksnapshot = require './mksnapshot-call'
getPathOfMksnapshot = require './mksnapshot-path'

# xx.yy.zz => xx.yy.0
stripVersion = (version) ->
  version = version.substr 1 if version[0] is 'v'
  versions = version.split '.'
  versions[2] = '0'
  versions.join '.'

mksnapshot = (content, target, version, arch, builddir, callback) ->
  version = stripVersion version
  getPathOfMksnapshot version, arch, builddir, (error, mksnapshot) ->
    return callback error if error
    callMksnapshot mksnapshot, content, target, builddir, callback

module.exports = mksnapshot
