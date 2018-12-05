<% unless h_visitor_saw? 'favs_intro' %>
($ 'main' ).prepend "<%= escape_javascript( render 'favs_dialog' ) %>"
<% end %>

($ '#fav_toggle_<%= @fav.entity.iid %>' ).replaceWith "<%= escape_javascript(
      render 'fav_toggle', entity: @fav.entity ) %>"
