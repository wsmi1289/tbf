module FormHelper

  def enum_options(object, attribute)
    plural_sym = (attribute.to_s.pluralize).to_sym
    enum = object.class.send(plural_sym)
    options_for_select(
      enum.map {|k, v| [k.humanize.capitalize, k]},
      selected: [ object[attribute].titleize, object[attribute] ]
    )
  end
end