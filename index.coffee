
command:"set-network.widget/getnet.sh"


refreshFrequency: 5000

style: """
  top: 310px
  left: 10px
  color: #fff
  font-family: Helvetica Neue

  div
    display: block
    border: 1px solid #fff
    text-shadow: 0 0 1px rgba(#000, 0.5)
    background: rgba(#000, 0.5)
    font-size: 24px
    font-weight: 100
    padding: 4px 6px 4px 6px
    height: 110px

    &:after
      content: 'Set Networking - Wi-Fi'
      position: absolute
      left: 0
      top: -14px
      font-size: 10px
      font-weight: 500
   input
   	background: none
   	border: 1px solid #fff
   	color: #fff
   	margin: 0 0 0 10px
   	padding: 5px
   	position: relative
   	float: right

   button
   	background: none
   	border: 1px solid white
   	color: white
   	position: relative
   	float: right


"""




render: (output) -> """
<div>
<label>IP Address</lable><input class="ip" type="text" value=""><br>
<label>Netmask</lable><input class="netmask" type="text" value="0"><br>
<label>Gateway</lable><input class="gateway" type="text" value="0"><br><button class='static' >STATIC</button><button class='dhcp' >DHCP</button>
</div>
"""

afterRender: (domEl) ->
  
  $(domEl).find('.static').on 'click', => @run("networksetup -setmanual \"Wi-Fi\" " + $(domEl).find('.ip').val() + " " + $(domEl).find('.netmask').val() + " " + $(domEl).find('.gateway').val())
  $(domEl).find('.dhcp').on 'click', =>@run("networksetup -setdhcp \"Wi-Fi\" ")

update: (output, domEl) ->

  data = JSON.parse output
  console.log()
  $(domEl).find('.ip').val(data.service.ipaddress)
  $(domEl).find('.netmask').val(data.service.netmask)
  $(domEl).find('.gateway').val(data.service.gateway)

