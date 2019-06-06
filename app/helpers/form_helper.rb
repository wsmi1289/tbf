module FormHelper
  def title_positions(position)
    positions = Post.title_positions
    options_for_select(
      positions.keys.map{ |p| [p.titleize, p] },
      selected: [position.titleize, position]
      )
  end
end