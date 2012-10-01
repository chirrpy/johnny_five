class CollectionGatewayInput < DetailedRadioInput
  def wrap(content)
    gateway_configuration_inputs = ''

    unless options[:value].blank?
      gateway                                      = options[:value].constantize
      gateway_configuration_class_name             = "#{options[:value]}Configuration"
      gateway_configuration_class_name_underscored = gateway_configuration_class_name.underscore
      gateway_configuration_class                  = gateway_configuration_class_name.constantize
      gateway_configuration                        = gateway_configuration_class.new

      @builder.simple_fields_for gateway_configuration_class_name_underscored.to_sym, gateway_configuration do |sf|
        gateway_configuration_inputs << sf.input(:type, :as => :hidden)

        if gateway.configurable?
          gateway_configuration.attributes.each_key do |attribute|
            gateway_configuration_label              = ['simple_form', 'labels', 'gateway_configuration', attribute].join('.')

            gateway_configuration_inputs << sf.input(attribute, label: I18n.translate(gateway_configuration_label),
                                                                as:    gateway_configuration.attribute_types[attribute],
                                                                value: gateway_configuration.attribute_types[attribute])
          end
        end
      end
    end

    return <<-FORMALICIOUS.html_safe
      #{template.content_tag wrapper_tag, content, wrapper_html_options}
      #{template.content_tag wrapper_tag, gateway_configuration_inputs.html_safe, :class => 'gateway_configuration'}
    FORMALICIOUS
  end
end
