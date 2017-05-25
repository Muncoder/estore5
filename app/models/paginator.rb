class Paginator

  attr_reader :objs, :per_page

  def initialize(objs, per_page)
    @objs = objs
    @per_page = per_page.to_f
  end

  def page_count
    (objs.count / per_page).ceil
  end

  def item_count
    objs.count
  end

  def page_item_count(page)
    return -1 if page > page_count
    return per_page if page < page_count

    objs % per_page
  end

  def page_index(item_index)
    real_index = item_index+1
    return -1 if (objs.count < real_index) || (item_index < 0)

    (real_index / per_page).ceil
  end
end