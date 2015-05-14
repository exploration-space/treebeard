<% from website.models import Node %>

<%inherit file="notify_base.mako" />

<% from website import util %>
<%def name="build_message(d, parent=None)">
%for key in d['children']:
    %if d['children'][key]['messages']:
        <table class="block" width="100%" border="0" cellpadding="15" cellspacing="0" align="center">
            <thead class="block-head">
            <th colspan="2" style="padding: 0px 15px 0px 15px;">
                <h3 style="padding: 0 15px 5px 15px; margin: 30px 0 0 0;border: none;list-style: none;font-weight: 300; border-bottom: 1px solid #eee; text-align: left;">
                ${Node.load(key).title}
                %if parent :
                    <small style="font-size: 14px;color: #999;"> in ${Node.load(parent).title}</small>
                %endif
                </h3>
            </th>
            </thead>
            <tbody>
            <tr>
                <td style="border-collapse: collapse;">
                    %for m in d['children'][key]['messages']:
                        ${m}
                    %endfor
                </td>
            </tr>
            </tbody>
        </table>
    %endif
    %if isinstance(d['children'][key]['children'], dict):
        ${build_message(d['children'][key], key )}
    %endif
%endfor
</%def>

<%def name="conent()">
<table id="content" width="600" border="0" cellpadding="25" cellspacing="0" align="center" style="margin: 30px auto 0 auto;background: white;box-shadow: 0 0 2px #ccc;">
  <tbody>
    <tr>
      <td style="border-collapse: collapse;">
        <h3 class="text-center" style="padding: 0;margin: 30px 0 0 0;border: none;list-style: none;font-weight: 300;text-align: center;">Recent Activity</h3>
      </td>
    </tr>
    <tr>
      <td style="border-collapse: collapse;">
        ${build_message(message)}
      </td>
    </tr>
  </tbody>
</table>
</%def>
