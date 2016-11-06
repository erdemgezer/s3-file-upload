class File
  upload: ->
    fetchPresignedURL (url) ->
      postToS3(url)

  fetchPresignedURL = (success) ->
    fileName = document.getElementById("cv_file").files[0].name
    $.getJSON "/presigned_s3_url?file_name=#{fileName}", (data) ->
      success(data.value)

  postToS3 = (presignedURL) ->
    file = document.getElementById("cv_file").files[0]
    $.ajax(
      method: 'PUT',
      url: presignedURL,
      data: file,
      processData: false,
      done: () -> alert('done'),
      fail: () -> alert('fail'),
    )

