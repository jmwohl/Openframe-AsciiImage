var pjson = require('./package.json'),
    debug = require('debug')('openframe:image'),
    extension = module.exports = {};

/**
 * Extension initialization method.
 *
 * Called when the extension (and its dependencies) have been installed.
 *
 * @param  {object} OF An interface provided to extensions giving limited access to the frame environment
 */
extension.init = function(OF) {
    // do your extension thing
    debug('=======>   Openframe-Image initialized!   <=======');

    /**
     * Extensions can add new artwork formats to the frame.
     *
     * Each format must have a unique name, which should correspond to the
     * name of the npm package.
     */
    OF.addFormat(
        {
            // the name should be the same as the package name
            'name': pjson.name,
            // this is what might get displayed to users
            'display_name': 'Image (JPG, PNG)',
            // does this type of artwork need to be downloaded to the frame?
            'download': true,
            // how do start this type of artwork? currently two token replacements, $filepath and $url
            'start_command': 'sudo fim -w --quiet -T 1 -t $filepath',
            // how do we stop this type of artwork?
            'end_command': 'sudo pkill -f fim'
        }
    );

    /**
     * Extensions also have access to the global event system
     */
    extension.pubsub = OF.getPubsub();
};

