$(function () {
    
    $('.friend-column').on('click', function() {
        let current = window.location.href.split('/');
        window.location.href = current[0] + "/" + this.id;
    });
    
}); 