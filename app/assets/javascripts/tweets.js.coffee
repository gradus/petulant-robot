$( () ->

  $('#search').click( () ->
    $('#search').val('') if $('#search').val() is "Search"
  )

  $('#search').keyup( () ->
    query = $('#search').val()
    if query.length > 1
      $('#tweets').empty()
      queryTweets(query)
  )

  queryTweets = (query) ->
    $.get("/api/tweets?query=#{query}", (tweets) ->
      i = 1
      for tweet in tweets
        $('#tweets').append("<div class='image'><img class='profile_image_#{i}' src='#{tweet.profile_image_url}' /></div>")
        $('#tweets').append("<div class='text'><p><b>#{tweet.from_user_name}</b></p><p>@#{tweet.from_user}</p><p>#{tweet.text}</p></div>")
        $('#tweets').append("<div class='clear'></div>")
        $('#tweets').append("<hr />")
        i++
    )
)
