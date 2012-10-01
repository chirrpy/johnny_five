module JohnnyFive
  module ButtonHelper
    def action_button(text, options = {})
      options[:class] = "action_button #{options[:class]}"

      build_button text, options
    end

    def small_action_button(text, options = {})
      options[:class] = "small_action_button #{options[:class]}"

      build_button text, options
    end

    def small_unemphasized_action_button(text, options = {})
      options[:class] = "small_unemphasized_action_button #{options[:class]}"

      build_button text, options
    end

    def emphasized_action_button(text, options = {})
      options[:class] = "emphasized_action_button #{options[:class]}"

      build_button text, options
    end

    def small_emphasized_action_button(text, options = {})
      options[:class] = "small_emphasized_action_button #{options[:class]}"

      build_button text, options
    end

  private
    def build_button(text, options = {})
      options[:type]  ||= :button
      @template         = options.delete(:view_template) || controller.view_context

      disabled_text     = options.delete(:disabled) ? 'disabled' : ''

      wrapper_options   = {
                            id:    options.delete(:wrapper_id)    || options[:id],
                            class: options.delete(:wrapper_class) || "#{options.delete(:class)} #{disabled_text}",
                            data:  { :guider => true }
                          }

      link_options      = {
                            id:    options.delete(:link_id)       || (options[:id] ? "#{options.delete(:id)}_link" : nil),
                            class: options.delete(:link_class)    || "action_button_text #{disabled_text}"
                          }.reverse_merge options

      @template.content_tag :div, wrapper_options do
        @template.content_tag(:span, '', :class => 'button_icon') do
          @template.content_tag(:span, '', :class =>'button_icon_anchor')
        end + send(:"#{options[:type]}_button", text, link_options)
      end
    end

    def link_button(text, options = {})
      href = options.delete(:href) || '#'

      link_to text, href, options
    end

    def button_button(text, options = {})
      @template.tag :input, options.merge(:value => text)
    end

    def submit_button(text, options = {})
      submit_tag text, options
    end
  end
end
