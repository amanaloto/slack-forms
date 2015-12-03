class Forms::PayrollHeroForm

  def generate_query_string params
    @params = params

    { :content => self.compose_content,
      :filetype => 'post',
      :title => "LATE: #{params[:date]}",
      # :channels => ::Form::CHANNEL_IDS[:payroll_hero]
      :channels => ::Form::CHANNEL_IDS[params[:channel].to_sym]
    }
  end



  protected

  def compose_content
    "Date: #{@params[:date]}\n" \
      "Time-in: #{@params[:time_in]}\n" \
      "Time-out: #{@params[:time_out]}\n" \
      "Reason: #{@params[:reason]}"
  end

end
