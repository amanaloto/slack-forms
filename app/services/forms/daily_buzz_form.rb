class Forms::DailyBuzzForm

  def generate_query_string params
    date_today = Time.now.strftime '%Y-%m-%d'

    query_string = {
      :content => params[:body],
      :filetype => 'post',
      :title => date_today,
      :initial_comment => params[:comment],
      :channels => ::Form::CHANNEL_IDS[params[:channel].to_sym]
    }
  end

end
