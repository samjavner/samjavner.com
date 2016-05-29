(function() {

    var $projects = $('#projects div');
    var tagged = {};
    var tags = [];

    $projects.each(function() {
        var project = this;
        var projectTags = $(this).data('tags');

        if (projectTags) {
            projectTags.split(',').forEach(function(tagName) {
                if (tagged[tagName] == null) {
                    tagged[tagName] = [];
                    tags.push(tagName);
                }
                tagged[tagName].push(project);
            });
        }
    });

    tags.sort();

    var $buttons = $('#buttons');

    $('<button/>', {
        text: 'Show All',
        class: 'btn btn-default btn-md active',
        style: 'margin:5px;',
        click: function() {
            $(this)
                .addClass('active')
                .siblings()
                .removeClass('active');
            $projects.show();
        }
    }).appendTo($buttons);

    $.each(tags, function(index, tagName) {
        $('<button/>', {
            text: tagName, // + ' (' + tagged[tagName].length + ')',
            class: 'btn btn-primary btn-md',
            style: 'margin:5px;',
            click: function() {
                $(this)
                    .addClass('active')
                    .siblings()
                    .removeClass('active');
                $projects
                    .hide()
                    .filter(tagged[tagName])
                    .show();
            }
        }).appendTo($buttons);
    });

}());