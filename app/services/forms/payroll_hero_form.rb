class Forms::PayrollHeroForm < Forms::BaseForm

  PAYROLL_FORM_TYPES = ['Missing Clock Out', 'Overtime']

  def generate_query_string params
    @params = params

    { :content => self.compose_content,
      :filetype => 'post',
      :title => "#{params[:type]}: #{params[:date]}",
      :channels => ::Form::CHANNEL_IDS[:'payroll-hero']
    }
  end

  def type
    Form::FORM_TYPES[1]
  end



  protected

  def compose_content
    "Date: #{@params[:date]}\n" +
      self.time_range +
      "Reason: #{@params[:reason]}"
  end

  def time_range
    return '' unless @params[:type] == 'Overtime'

    "Start-time: #{format_time_select(@params[:start_time])}\n" \
    "End-time: #{format_time_select(@params[:end_time])}\n"
  end

  def format_time_select time_input
    Time.parse("#{time_input['(4i)']}:#{time_input['(5i)']}").
      strftime('%l:%M %P')
  end

end
