module MailHelper
  NUMBER_NAMES ||= %w[zero one two three four five six seven eight nine ten eleven twelve]

  def ink_body(options={}, &block)
    options = default_classes(options, 'body')
    ink_onetable(options) do
      ink_cell(class: 'center', align: 'center', valign: 'top') do
        content_tag(:center, &block)
      end
    end
  end

  def ink_container(options={}, cell_options: {}, &block)
    options = default_classes(options, 'container')
    ink_onetable(options) do
      ink_cell(cell_options, &block)
    end
  end

  def ink_row(options={}, cell_options: {}, &block)
    options = default_classes(options, 'row')
    ink_onetable(options) do
      content_tag(:tr) do
        ink_cell(cell_options, &block)
      end
    end
  end

  def ink_column(columns, options={}, last: false)
    column_classes = ['columns', NUMBER_NAMES[columns]]
    options = default_classes(options, column_classes)

    ink_onetable(options) do
      [yield, tag(:td, class: 'expander')]
    end
  end

  def ink_cell(options={}, &block)
    if options[:center]
      options[:class] = '' unless options.key? :class
      options[:class] += ' center'
      options[:align] = 'center'

      inner = block
      block = Proc.new do
        content_tag(:center, &inner)
      end
    end
    content_tag(:td, options, &block)
  end

  def ink_onetable(options={}, &block)
    content_tag(:table, options) do
      content_tag(:tr, &block)
    end
  end

  private

  def default_classes(options, defaults)
    defaults = defaults.join(' ') unless defaults.is_a? String
    options[:class] = ''
    options[:class] += ' ' + defaults
    options
  end
end
