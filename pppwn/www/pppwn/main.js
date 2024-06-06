var appView = Backbone.View.extend({
    el: '#app-v-pppwn',
    template: _.template($('#appWeb').html()),
    initialize: function(){
        var self = this;
        var params = new URLSearchParams({
            task:'log',
            token:'token_id'
        });
        fetch('/cgi-bin/pw.cgi', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: params.toString(),
        }).then(function(response){
            if(response.ok){
                return response.text();
            }else{
                throw new Error("Error cannot get logs.");
            }
        })
        .then(function(data){
            data=data.split("\n");
            var log = "";
            data.forEach(function(value){
               log = log + value + "<br/>"; 
            });
            $('#task-log').find('.view').append(log).append('<br>');
        })
        .catch(function(error){
            $('#task-log').find('.view').append(error+'<br>');
        });
        this.data = {};
        this.render();
    },
    render: function(){
        this.$el.html(this.template(this.data));
        return this;
    },
    events: {
        'click #id_restart': function(){

            var params = new URLSearchParams({
                task:'restart',
                token:'token_id',
            });
            $('#task-log').find('.view').append('Restarting PPPwn...'+'<br/>')
            fetch('/cgi-bin/pw.cgi', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: params.toString(),
            }).then(function(response){
                if(response.ok){
                    return response.text();
                }else{
                    throw new Error("Error cannot execute task.");
                }
            })
            .then(function(response){
                $('#task-log').find('.view').append(response).append('<br>');
            })
            .catch(function(error){
                $('#task-log').find('.view').append(error+'<br>');
            });
        }
    }
});
new appView();