<% ( 0..1 ).each do |offset| %>
<% time = @now - ( offset * 30 ).minutes %>
<% time_logs = @logs.reject { |l| time < l.created_at or time - 30.minutes > l.created_at } %>
<% ip_groups = time_logs.group_by { |l| l.ip } %>
  
console.log '-- remove <%= time.strftime '%y%m%d%H%M' %>'
$slot = ($ '#<%= time.strftime '%y%m%d%H%M' %>')
if $slot
  $slot.before '<%= escape_javascript( render 'logs/log_slot', time: time, ip_groups: ip_groups ) %>'
  $slot.remove()
else
  ($ '.log_list' ).prepend '<%= escape_javascript( render 'logs/log_slot', time: time, ip_groups: ip_groups ) %>'

<% end %>

# refresh the timeout
timeout_id = ($ '.log_list').data 'cockpit_timeout'
if timeout_id != null
  clearTimeout timeout_id

timeout_id = setTimeout ->
  $.getScript '/cockpit'
, 5000
($ '.log_list' ).data 'cockpit_timeout', timeout_id
