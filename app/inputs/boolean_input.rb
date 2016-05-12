class BooleanInput < SimpleForm::Inputs::Base
  def input(wrapper_options = nil)
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

    if nested_boolean_style?
      build_hidden_field_for_checkbox +
      build_check_box_without_hidden_field(merged_input_options) +
      inline_label
    else
      build_check_box(unchecked_value, merged_input_options)
    end
  end

  private

  def build_check_box(unchecked_value, options)
    @builder.check_box(attribute_name, options, checked_value, unchecked_value)
  end

  def build_check_box_without_hidden_field(options)
    build_check_box(nil, options)
  end

  def build_hidden_field_for_checkbox
    options = { value: unchecked_value, id: nil, disabled: input_html_options[:disabled] }
    options[:name] = input_html_options[:name] if input_html_options.has_key?(:name)

    @builder.hidden_field(attribute_name, options)
  end

  def inline_label
    inline_option = options[:inline_label]

    if inline_option
      label = inline_option == true ? label_text : html_escape(inline_option)
      " #{label}".html_safe
    end
  end

  def checked_value
    options.fetch(:checked_value, '1')
  end

  def unchecked_value
    options.fetch(:unchecked_value, '0')
  end
end
