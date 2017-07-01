





(function() {
       
    var styled_submit = '<a style="color: #369; text-decoration: none;" href="https://www.reddit.com/submit?url=https%3A%2F%2Fdeis.com%2Fblog%2F2015%2Fcoreos-on-virtualbox%2F&amp;amp;title=" target="_new">';
    var unstyled_submit = '<a href="https://www.reddit.com/submit?url=https%3A%2F%2Fdeis.com%2Fblog%2F2015%2Fcoreos-on-virtualbox%2F&amp;title=" target="https://www.reddit.com/submit?url=https%3A%2F%2Fdeis.com%2Fblog%2F2015%2Fcoreos-on-virtualbox%2F&amp;amp;title=">';
    var write_string='<span class="reddit_button" style="';
    write_string += '">';
    write_string += unstyled_submit + '<img style="height: 2.3ex; vertical-align:top; margin-right: 1ex" src="//www.redditstatic.com/spreddit2.gif">' + "</a>";
    write_string += unstyled_submit + 'submit';
    write_string += '</a>';
    write_string += '</span>';

document.write(write_string);
})()
