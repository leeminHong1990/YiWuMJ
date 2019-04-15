<GameFile>
  <PropertyGroup Name="CreateAgentRoomUI" Type="Layer" ID="abc34471-0447-4818-b5bc-872a89523b8a" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.0000" />
      <ObjectData Name="Layer" Tag="537" ctype="GameLayerObjectData">
        <Size X="1280.0000" Y="720.0000" />
        <Children>
          <AbstractNodeData Name="createroom_panel" ActionTag="359421217" Tag="539" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" LeftEage="29" RightEage="29" TopEage="35" BottomEage="35" Scale9OriginX="29" Scale9OriginY="35" Scale9Width="1222" Scale9Height="650" ctype="PanelObjectData">
            <Size X="1280.0000" Y="720.0000" />
            <Children>
              <AbstractNodeData Name="title_img" ActionTag="-443830276" Tag="544" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="548.5680" RightMargin="553.4320" TopMargin="-0.6800" BottomMargin="674.6800" LeftEage="48" RightEage="48" TopEage="15" BottomEage="15" Scale9OriginX="48" Scale9OriginY="15" Scale9Width="82" Scale9Height="16" ctype="ImageViewObjectData">
                <Size X="178.0000" Y="46.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="637.5680" Y="697.6800" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.4981" Y="0.9690" />
                <PreSize X="0.1391" Y="0.0639" />
                <FileData Type="Normal" Path="CreateAgentRoomUI/agent_title.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="return_btn" ActionTag="-933136569" Tag="545" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="55.8000" RightMargin="1054.2000" TopMargin="-6.6880" BottomMargin="670.6880" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="116" Scale9Height="34" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                <Size X="170.0000" Y="56.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="140.8000" Y="698.6880" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.1100" Y="0.9704" />
                <PreSize X="0.1328" Y="0.0778" />
                <TextColor A="255" R="65" G="65" B="70" />
                <NormalFileData Type="Normal" Path="Default/back_btn.png" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="gamename_panel" ActionTag="-1520708237" Tag="547" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="607.6080" RightMargin="22.3920" TopMargin="66.9680" BottomMargin="3.0320" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size X="650.0000" Y="650.0000" />
                <Children>
                  <AbstractNodeData Name="create_btn" ActionTag="237259243" Tag="548" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="265.9500" RightMargin="132.0500" TopMargin="544.3800" BottomMargin="-8.3800" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="222" Scale9Height="92" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                    <Size X="252.0000" Y="114.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="391.9500" Y="48.6200" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.6030" Y="0.0748" />
                    <PreSize X="0.3877" Y="0.1754" />
                    <TextColor A="255" R="65" G="65" B="70" />
                    <NormalFileData Type="Normal" Path="Default/ok_btn.png" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="tips_label" ActionTag="2053317184" Tag="549" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="-17.9900" RightMargin="117.9900" TopMargin="478.5450" BottomMargin="141.4550" IsCustomSize="True" FontSize="20" LabelText="注：房卡在开始游戏后扣除，提前解散房间不扣房卡" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="550.0000" Y="30.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="257.0100" Y="156.4550" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="144" G="175" B="104" />
                    <PrePosition X="0.3954" Y="0.2407" />
                    <PreSize X="0.8462" Y="0.0462" />
                    <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="mode_label" ActionTag="660497155" Tag="550" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="7.9800" RightMargin="542.0200" TopMargin="97.8550" BottomMargin="518.1450" IsCustomSize="True" FontSize="30" LabelText="规则：" HorizontalAlignmentType="HT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="100.0000" Y="34.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="57.9800" Y="535.1450" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="220" G="179" B="125" />
                    <PrePosition X="0.0892" Y="0.8233" />
                    <PreSize X="0.1538" Y="0.0523" />
                    <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="round_mode_chx1" ActionTag="441324419" Tag="551" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="96.9800" RightMargin="501.0200" TopMargin="91.8550" BottomMargin="512.1450" TouchEnable="True" CheckedState="True" ctype="CheckBoxObjectData">
                    <Size X="52.0000" Y="46.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="122.9800" Y="535.1450" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.1892" Y="0.8233" />
                    <PreSize X="0.0800" Y="0.0708" />
                    <NormalBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <PressedBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <DisableBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <NodeNormalFileData Type="Normal" Path="HelpUI/chx_select.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="round_mode_chx2" ActionTag="-1114331172" Tag="552" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="272.4800" RightMargin="325.5200" TopMargin="91.8550" BottomMargin="512.1450" TouchEnable="True" ctype="CheckBoxObjectData">
                    <Size X="52.0000" Y="46.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="298.4800" Y="535.1450" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.4592" Y="0.8233" />
                    <PreSize X="0.0800" Y="0.0708" />
                    <NormalBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <PressedBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <DisableBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <NodeNormalFileData Type="Normal" Path="HelpUI/chx_select.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="round_mode_label_1" ActionTag="-636226574" Tag="553" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="142.4800" RightMargin="357.5200" TopMargin="98.8550" BottomMargin="519.1450" IsCustomSize="True" FontSize="30" LabelText="打捆" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="150.0000" Y="32.0000" />
                    <AnchorPoint ScaleY="0.5000" />
                    <Position X="142.4800" Y="535.1450" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="220" G="179" B="125" />
                    <PrePosition X="0.2192" Y="0.8233" />
                    <PreSize X="0.2308" Y="0.0492" />
                    <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="round_mode_label_2" ActionTag="-268043007" Tag="554" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="317.9800" RightMargin="182.0200" TopMargin="98.8550" BottomMargin="519.1450" IsCustomSize="True" FontSize="30" LabelText="长跑" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="150.0000" Y="32.0000" />
                    <AnchorPoint ScaleY="0.5000" />
                    <Position X="317.9800" Y="535.1450" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="220" G="179" B="125" />
                    <PrePosition X="0.4892" Y="0.8233" />
                    <PreSize X="0.2308" Y="0.0492" />
                    <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="round_label" ActionTag="1995150787" Tag="555" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="7.9800" RightMargin="542.0200" TopMargin="162.2950" BottomMargin="455.7050" IsCustomSize="True" FontSize="30" LabelText="分数：" HorizontalAlignmentType="HT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="100.0000" Y="32.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="57.9800" Y="471.7050" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="220" G="179" B="125" />
                    <PrePosition X="0.0892" Y="0.7257" />
                    <PreSize X="0.1538" Y="0.0492" />
                    <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="score_chx1" ActionTag="50859220" Tag="1270" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="96.9800" RightMargin="501.0200" TopMargin="156.8550" BottomMargin="447.1450" TouchEnable="True" CheckedState="True" ctype="CheckBoxObjectData">
                    <Size X="52.0000" Y="46.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="122.9800" Y="470.1450" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.1892" Y="0.7233" />
                    <PreSize X="0.0800" Y="0.0708" />
                    <NormalBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <PressedBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <DisableBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <NodeNormalFileData Type="Normal" Path="HelpUI/chx_select.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="score_label_1" ActionTag="1974498317" Tag="1269" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="142.4800" RightMargin="357.5200" TopMargin="163.8550" BottomMargin="454.1450" IsCustomSize="True" FontSize="30" LabelText="100分" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="150.0000" Y="32.0000" />
                    <AnchorPoint ScaleY="0.5000" />
                    <Position X="142.4800" Y="470.1450" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="220" G="179" B="125" />
                    <PrePosition X="0.2192" Y="0.7233" />
                    <PreSize X="0.2308" Y="0.0492" />
                    <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="round_chx1" ActionTag="1404315520" VisibleForFrame="False" Tag="556" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="96.9800" RightMargin="501.0200" TopMargin="156.8550" BottomMargin="447.1450" TouchEnable="True" CheckedState="True" ctype="CheckBoxObjectData">
                    <Size X="52.0000" Y="46.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="122.9800" Y="470.1450" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.1892" Y="0.7233" />
                    <PreSize X="0.0800" Y="0.0708" />
                    <NormalBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <PressedBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <DisableBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <NodeNormalFileData Type="Normal" Path="HelpUI/chx_select.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="round_chx2" ActionTag="1947625019" VisibleForFrame="False" Tag="557" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="272.4800" RightMargin="325.5200" TopMargin="156.8550" BottomMargin="447.1450" TouchEnable="True" ctype="CheckBoxObjectData">
                    <Size X="52.0000" Y="46.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="298.4800" Y="470.1450" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.4592" Y="0.7233" />
                    <PreSize X="0.0800" Y="0.0708" />
                    <NormalBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <PressedBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <DisableBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <NodeNormalFileData Type="Normal" Path="HelpUI/chx_select.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="round_chx3" ActionTag="734361145" VisibleForFrame="False" Tag="558" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="447.9800" RightMargin="150.0200" TopMargin="156.8550" BottomMargin="447.1450" TouchEnable="True" ctype="CheckBoxObjectData">
                    <Size X="52.0000" Y="46.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="473.9800" Y="470.1450" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.7292" Y="0.7233" />
                    <PreSize X="0.0800" Y="0.0708" />
                    <NormalBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <PressedBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <DisableBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <NodeNormalFileData Type="Normal" Path="HelpUI/chx_select.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="round_num_label_1" ActionTag="1149657203" VisibleForFrame="False" Tag="559" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="142.4800" RightMargin="357.5200" TopMargin="163.8550" BottomMargin="454.1450" IsCustomSize="True" FontSize="30" LabelText="8局" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="150.0000" Y="32.0000" />
                    <AnchorPoint ScaleY="0.5000" />
                    <Position X="142.4800" Y="470.1450" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="220" G="179" B="125" />
                    <PrePosition X="0.2192" Y="0.7233" />
                    <PreSize X="0.2308" Y="0.0492" />
                    <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="round_num_label_2" ActionTag="-288738306" VisibleForFrame="False" Tag="560" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="317.9800" RightMargin="182.0200" TopMargin="163.8550" BottomMargin="454.1450" IsCustomSize="True" FontSize="30" LabelText="16局" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="150.0000" Y="32.0000" />
                    <AnchorPoint ScaleY="0.5000" />
                    <Position X="317.9800" Y="470.1450" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="220" G="179" B="125" />
                    <PrePosition X="0.4892" Y="0.7233" />
                    <PreSize X="0.2308" Y="0.0492" />
                    <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="round_num_label_3" ActionTag="1877963363" VisibleForFrame="False" Tag="561" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="493.4800" RightMargin="6.5200" TopMargin="163.8550" BottomMargin="454.1450" IsCustomSize="True" FontSize="30" LabelText="24局" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="150.0000" Y="32.0000" />
                    <AnchorPoint ScaleY="0.5000" />
                    <Position X="493.4800" Y="470.1450" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="220" G="179" B="125" />
                    <PrePosition X="0.7592" Y="0.7233" />
                    <PreSize X="0.2308" Y="0.0492" />
                    <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="king_label" ActionTag="1417488214" Tag="1285" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="7.9800" RightMargin="542.0200" TopMargin="228.8550" BottomMargin="389.1450" IsCustomSize="True" FontSize="30" LabelText="财神：" HorizontalAlignmentType="HT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="100.0000" Y="32.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="57.9800" Y="405.1450" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="220" G="179" B="125" />
                    <PrePosition X="0.0892" Y="0.6233" />
                    <PreSize X="0.1538" Y="0.0492" />
                    <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="king_chx2" ActionTag="1091789286" Tag="1284" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="272.4800" RightMargin="325.5200" TopMargin="221.8550" BottomMargin="382.1450" TouchEnable="True" ctype="CheckBoxObjectData">
                    <Size X="52.0000" Y="46.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="298.4800" Y="405.1450" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.4592" Y="0.6233" />
                    <PreSize X="0.0800" Y="0.0708" />
                    <NormalBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <PressedBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <DisableBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <NodeNormalFileData Type="Normal" Path="HelpUI/chx_select.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="king_chx1" ActionTag="1454129162" Tag="1283" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="97.0450" RightMargin="500.9550" TopMargin="221.8550" BottomMargin="382.1450" TouchEnable="True" CheckedState="True" ctype="CheckBoxObjectData">
                    <Size X="52.0000" Y="46.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="123.0450" Y="405.1450" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.1893" Y="0.6233" />
                    <PreSize X="0.0800" Y="0.0708" />
                    <NormalBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <PressedBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <DisableBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <NodeNormalFileData Type="Normal" Path="HelpUI/chx_select.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="king_label_2" ActionTag="-943724057" Tag="1282" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="317.9800" RightMargin="182.0200" TopMargin="228.8550" BottomMargin="389.1450" IsCustomSize="True" FontSize="30" LabelText="发财财神" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="150.0000" Y="32.0000" />
                    <AnchorPoint ScaleY="0.5000" />
                    <Position X="317.9800" Y="405.1450" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="220" G="179" B="125" />
                    <PrePosition X="0.4892" Y="0.6233" />
                    <PreSize X="0.2308" Y="0.0492" />
                    <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="king_label_1" ActionTag="2017510405" Tag="1281" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="142.4800" RightMargin="357.5200" TopMargin="228.8550" BottomMargin="389.1450" IsCustomSize="True" FontSize="30" LabelText="翻财神" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="150.0000" Y="32.0000" />
                    <AnchorPoint ScaleY="0.5000" />
                    <Position X="142.4800" Y="405.1450" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="220" G="179" B="125" />
                    <PrePosition X="0.2192" Y="0.6233" />
                    <PreSize X="0.2308" Y="0.0492" />
                    <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="job_label_2" ActionTag="-740411554" VisibleForFrame="False" Tag="1271" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="317.9800" RightMargin="32.0200" TopMargin="358.8550" BottomMargin="259.1450" IsCustomSize="True" FontSize="30" LabelText="承包以及反承包" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="300.0000" Y="32.0000" />
                    <AnchorPoint ScaleY="0.5000" />
                    <Position X="317.9800" Y="275.1450" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="220" G="179" B="125" />
                    <PrePosition X="0.4892" Y="0.4233" />
                    <PreSize X="0.4615" Y="0.0492" />
                    <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="job_label_1" ActionTag="2086969188" VisibleForFrame="False" Tag="1272" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="142.4800" RightMargin="357.5200" TopMargin="358.8550" BottomMargin="259.1450" IsCustomSize="True" FontSize="30" LabelText="不承包" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="150.0000" Y="32.0000" />
                    <AnchorPoint ScaleY="0.5000" />
                    <Position X="142.4800" Y="275.1450" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="220" G="179" B="125" />
                    <PrePosition X="0.2192" Y="0.4233" />
                    <PreSize X="0.2308" Y="0.0492" />
                    <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="job_chx2" ActionTag="486107095" VisibleForFrame="False" Tag="1273" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="272.4800" RightMargin="325.5200" TopMargin="351.8550" BottomMargin="252.1450" TouchEnable="True" ctype="CheckBoxObjectData">
                    <Size X="52.0000" Y="46.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="298.4800" Y="275.1450" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.4592" Y="0.4233" />
                    <PreSize X="0.0800" Y="0.0708" />
                    <NormalBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <PressedBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <DisableBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <NodeNormalFileData Type="Normal" Path="HelpUI/chx_select.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="job_chx1" ActionTag="432356186" VisibleForFrame="False" Tag="1274" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="96.9800" RightMargin="501.0200" TopMargin="351.8550" BottomMargin="252.1450" TouchEnable="True" CheckedState="True" ctype="CheckBoxObjectData">
                    <Size X="52.0000" Y="46.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="122.9800" Y="275.1450" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.1892" Y="0.4233" />
                    <PreSize X="0.0800" Y="0.0708" />
                    <NormalBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <PressedBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <DisableBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <NodeNormalFileData Type="Normal" Path="HelpUI/chx_select.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="job_label" ActionTag="-753002397" VisibleForFrame="False" Tag="1275" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="7.9800" RightMargin="542.0200" TopMargin="358.8550" BottomMargin="259.1450" IsCustomSize="True" FontSize="30" LabelText="承包：" HorizontalAlignmentType="HT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="100.0000" Y="32.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="57.9800" Y="275.1450" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="220" G="179" B="125" />
                    <PrePosition X="0.0892" Y="0.4233" />
                    <PreSize X="0.1538" Y="0.0492" />
                    <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="base_score_mode_label_2" ActionTag="1680067533" Tag="1276" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="317.9800" RightMargin="182.0200" TopMargin="293.8550" BottomMargin="324.1450" IsCustomSize="True" FontSize="30" LabelText="11个13个" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="150.0000" Y="32.0000" />
                    <AnchorPoint ScaleY="0.5000" />
                    <Position X="317.9800" Y="340.1450" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="220" G="179" B="125" />
                    <PrePosition X="0.4892" Y="0.5233" />
                    <PreSize X="0.2308" Y="0.0492" />
                    <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="base_score_mode_label_1" ActionTag="1003939370" Tag="1277" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="142.4800" RightMargin="357.5200" TopMargin="293.8550" BottomMargin="324.1450" IsCustomSize="True" FontSize="30" LabelText="7个9个" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="150.0000" Y="32.0000" />
                    <AnchorPoint ScaleY="0.5000" />
                    <Position X="142.4800" Y="340.1450" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="220" G="179" B="125" />
                    <PrePosition X="0.2192" Y="0.5233" />
                    <PreSize X="0.2308" Y="0.0492" />
                    <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="base_score_mode_chx2" ActionTag="-1708570398" Tag="1278" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="272.4800" RightMargin="325.5200" TopMargin="286.8550" BottomMargin="317.1450" TouchEnable="True" ctype="CheckBoxObjectData">
                    <Size X="52.0000" Y="46.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="298.4800" Y="340.1450" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.4592" Y="0.5233" />
                    <PreSize X="0.0800" Y="0.0708" />
                    <NormalBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <PressedBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <DisableBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <NodeNormalFileData Type="Normal" Path="HelpUI/chx_select.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="base_score_mode_chx1" ActionTag="-714169445" Tag="1279" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="96.9800" RightMargin="501.0200" TopMargin="286.8550" BottomMargin="317.1450" TouchEnable="True" CheckedState="True" ctype="CheckBoxObjectData">
                    <Size X="52.0000" Y="46.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="122.9800" Y="340.1450" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.1892" Y="0.5233" />
                    <PreSize X="0.0800" Y="0.0708" />
                    <NormalBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <PressedBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <DisableBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <NodeNormalFileData Type="Normal" Path="HelpUI/chx_select.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="base_score_mode_label" ActionTag="637560074" Tag="1280" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="7.9800" RightMargin="542.0200" TopMargin="293.8550" BottomMargin="324.1450" IsCustomSize="True" FontSize="30" LabelText="底注：" HorizontalAlignmentType="HT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="100.0000" Y="32.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="57.9800" Y="340.1450" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="220" G="179" B="125" />
                    <PrePosition X="0.0892" Y="0.5233" />
                    <PreSize X="0.1538" Y="0.0492" />
                    <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="cost_label" ActionTag="-1111256945" Tag="585" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="7.9800" RightMargin="542.0200" TopMargin="358.8550" BottomMargin="259.1450" IsCustomSize="True" FontSize="30" LabelText="消耗：" HorizontalAlignmentType="HT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="100.0000" Y="32.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="57.9800" Y="275.1450" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="220" G="179" B="125" />
                    <PrePosition X="0.0892" Y="0.4233" />
                    <PreSize X="0.1538" Y="0.0492" />
                    <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="cost_num_label" ActionTag="1419322172" Tag="586" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="148.9800" RightMargin="401.0200" TopMargin="358.8550" BottomMargin="259.1450" IsCustomSize="True" FontSize="30" LabelText="x 99" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="100.0000" Y="32.0000" />
                    <AnchorPoint ScaleY="0.5000" />
                    <Position X="148.9800" Y="275.1450" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="220" G="179" B="125" />
                    <PrePosition X="0.2292" Y="0.4233" />
                    <PreSize X="0.1538" Y="0.0492" />
                    <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="card_img" ActionTag="831286568" Tag="587" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="89.9800" RightMargin="494.0200" TopMargin="352.8550" BottomMargin="253.1450" LeftEage="21" RightEage="21" TopEage="14" BottomEage="14" Scale9OriginX="21" Scale9OriginY="14" Scale9Width="24" Scale9Height="16" ctype="ImageViewObjectData">
                    <Size X="66.0000" Y="44.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="122.9800" Y="275.1450" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.1892" Y="0.4233" />
                    <PreSize X="0.1015" Y="0.0677" />
                    <FileData Type="Normal" Path="GameHallUI/card.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="prepare_chx" ActionTag="-1292737988" Tag="588" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="26.0000" RightMargin="572.0000" TopMargin="573.3100" BottomMargin="30.6900" TouchEnable="True" CheckedState="True" ctype="CheckBoxObjectData">
                    <Size X="52.0000" Y="46.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="52.0000" Y="53.6900" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.0800" Y="0.0826" />
                    <PreSize X="0.0800" Y="0.0708" />
                    <NormalBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <PressedBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <DisableBackFileData Type="Normal" Path="HelpUI/chx_bg.png" Plist="" />
                    <NodeNormalFileData Type="Normal" Path="HelpUI/chx_select.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="prepare_label" ActionTag="263650920" Tag="589" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="84.5000" RightMargin="365.5000" TopMargin="583.4800" BottomMargin="38.5200" IsCustomSize="True" FontSize="20" LabelText="手动准备开局" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="200.0000" Y="28.0000" />
                    <AnchorPoint ScaleY="0.5000" />
                    <Position X="84.5000" Y="52.5200" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="220" G="179" B="125" />
                    <PrePosition X="0.1300" Y="0.0808" />
                    <PreSize X="0.3077" Y="0.0431" />
                    <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="name_label" ActionTag="806939859" Tag="711" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="7.9800" RightMargin="542.0200" TopMargin="34.4800" BottomMargin="581.5200" IsCustomSize="True" FontSize="30" LabelText="游戏：" HorizontalAlignmentType="HT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="100.0000" Y="34.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="57.9800" Y="598.5200" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="220" G="179" B="125" />
                    <PrePosition X="0.0892" Y="0.9208" />
                    <PreSize X="0.1538" Y="0.0523" />
                    <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="name_txt" ActionTag="1098652535" Tag="712" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="90.5900" RightMargin="379.4100" TopMargin="33.0664" BottomMargin="582.9336" IsCustomSize="True" FontSize="34" LabelText="义乌棋牌" HorizontalAlignmentType="HT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="180.0000" Y="34.0000" />
                    <AnchorPoint ScaleX="0.3995" ScaleY="1.4946" />
                    <Position X="162.5000" Y="633.7500" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="220" G="179" B="125" />
                    <PrePosition X="0.2500" Y="0.9750" />
                    <PreSize X="0.2769" Y="0.0523" />
                    <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="separator1" ActionTag="-642019929" Tag="1423" IconVisible="False" PositionPercentXEnabled="True" LeftMargin="5.0000" RightMargin="5.0000" TopMargin="142.0000" BottomMargin="502.0000" LeftEage="81" RightEage="81" TopEage="1" BottomEage="1" Scale9OriginX="81" Scale9OriginY="1" Scale9Width="86" Scale9Height="4" ctype="ImageViewObjectData">
                    <Size X="640.0000" Y="6.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="325.0000" Y="505.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.5000" Y="0.7769" />
                    <PreSize X="0.9846" Y="0.0092" />
                    <FileData Type="Normal" Path="CreateAgentRoomUI/separator_1.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="separator2" ActionTag="-853123187" Tag="1424" IconVisible="False" PositionPercentXEnabled="True" LeftMargin="5.0000" RightMargin="5.0000" TopMargin="207.0000" BottomMargin="437.0000" LeftEage="81" RightEage="81" TopEage="1" BottomEage="1" Scale9OriginX="81" Scale9OriginY="1" Scale9Width="86" Scale9Height="4" ctype="ImageViewObjectData">
                    <Size X="640.0000" Y="6.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="325.0000" Y="440.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.5000" Y="0.6769" />
                    <PreSize X="0.9846" Y="0.0092" />
                    <FileData Type="Normal" Path="CreateAgentRoomUI/separator_1.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="separator3" ActionTag="116638312" Tag="1425" IconVisible="False" PositionPercentXEnabled="True" LeftMargin="5.0000" RightMargin="5.0000" TopMargin="337.0000" BottomMargin="307.0000" LeftEage="81" RightEage="81" TopEage="1" BottomEage="1" Scale9OriginX="81" Scale9OriginY="1" Scale9Width="86" Scale9Height="4" ctype="ImageViewObjectData">
                    <Size X="640.0000" Y="6.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="325.0000" Y="310.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.5000" Y="0.4769" />
                    <PreSize X="0.9846" Y="0.0092" />
                    <FileData Type="Normal" Path="CreateAgentRoomUI/separator_1.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="separator4" ActionTag="449596595" Tag="1426" IconVisible="False" PositionPercentXEnabled="True" LeftMargin="5.0000" RightMargin="5.0000" TopMargin="406.0637" BottomMargin="237.9363" LeftEage="81" RightEage="81" TopEage="1" BottomEage="1" Scale9OriginX="81" Scale9OriginY="1" Scale9Width="86" Scale9Height="4" ctype="ImageViewObjectData">
                    <Size X="640.0000" Y="6.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="325.0000" Y="240.9363" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.5000" Y="0.3707" />
                    <PreSize X="0.9846" Y="0.0092" />
                    <FileData Type="Normal" Path="CreateAgentRoomUI/separator_1.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="separator5" ActionTag="502321108" VisibleForFrame="False" Tag="866" IconVisible="False" PositionPercentXEnabled="True" LeftMargin="5.0000" RightMargin="5.0000" TopMargin="472.0000" BottomMargin="172.0000" LeftEage="81" RightEage="81" TopEage="1" BottomEage="1" Scale9OriginX="81" Scale9OriginY="1" Scale9Width="86" Scale9Height="4" ctype="ImageViewObjectData">
                    <Size X="640.0000" Y="6.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="325.0000" Y="175.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.5000" Y="0.2692" />
                    <PreSize X="0.9846" Y="0.0092" />
                    <FileData Type="Normal" Path="CreateAgentRoomUI/separator_1.png" Plist="" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="932.6080" Y="328.0320" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.7286" Y="0.4556" />
                <PreSize X="0.5078" Y="0.9028" />
                <SingleColor A="255" R="150" G="200" B="255" />
                <FirstColor A="255" R="150" G="200" B="255" />
                <EndColor A="255" R="255" G="255" B="255" />
                <ColorVector ScaleY="1.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="complete_btn" ActionTag="-1022871910" Tag="727" IconVisible="False" LeftMargin="302.0000" RightMargin="762.0000" TopMargin="80.0000" BottomMargin="560.0000" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="186" Scale9Height="58" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                <Size X="216.0000" Y="80.0000" />
                <Children>
                  <AbstractNodeData Name="complete_img" ActionTag="284106738" Tag="728" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" PercentWidthEnable="True" PercentHeightEnable="True" PercentWidthEnabled="True" PercentHeightEnabled="True" LeftMargin="50.0040" RightMargin="50.0040" TopMargin="22.0000" BottomMargin="22.0000" LeftEage="38" RightEage="38" TopEage="11" BottomEage="11" Scale9OriginX="38" Scale9OriginY="11" Scale9Width="40" Scale9Height="14" ctype="ImageViewObjectData">
                    <Size X="115.9920" Y="36.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="108.0000" Y="40.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.5000" Y="0.5000" />
                    <PreSize X="0.5370" Y="0.4500" />
                    <FileData Type="Normal" Path="CreateAgentRoomUI/complete_btn.png" Plist="" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="410.0000" Y="600.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.3203" Y="0.8333" />
                <PreSize X="0.1688" Y="0.1111" />
                <TextColor A="255" R="65" G="65" B="70" />
                <DisabledFileData Type="Normal" Path="CreateAgentRoomUI/bright_icon.png" Plist="" />
                <PressedFileData Type="Normal" Path="CreateAgentRoomUI/bright_icon.png" Plist="" />
                <NormalFileData Type="Normal" Path="CreateAgentRoomUI/dark_icon.png" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="playing_btn" ActionTag="-19204883" Tag="723" IconVisible="False" LeftMargin="92.0000" RightMargin="972.0000" TopMargin="80.0000" BottomMargin="560.0000" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="186" Scale9Height="58" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                <Size X="216.0000" Y="80.0000" />
                <Children>
                  <AbstractNodeData Name="playing_img" ActionTag="-748981534" Tag="726" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="48.0000" RightMargin="48.0000" TopMargin="21.0000" BottomMargin="21.0000" LeftEage="39" RightEage="39" TopEage="12" BottomEage="12" Scale9OriginX="39" Scale9OriginY="12" Scale9Width="42" Scale9Height="14" ctype="ImageViewObjectData">
                    <Size X="120.0000" Y="38.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="108.0000" Y="40.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.5000" Y="0.5000" />
                    <PreSize X="0.5556" Y="0.4750" />
                    <FileData Type="Normal" Path="CreateAgentRoomUI/playing_btn.png" Plist="" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="200.0000" Y="600.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.1563" Y="0.8333" />
                <PreSize X="0.1688" Y="0.1111" />
                <TextColor A="255" R="65" G="65" B="70" />
                <DisabledFileData Type="Normal" Path="CreateAgentRoomUI/bright_icon.png" Plist="" />
                <PressedFileData Type="Normal" Path="CreateAgentRoomUI/bright_icon.png" Plist="" />
                <NormalFileData Type="Normal" Path="CreateAgentRoomUI/dark_icon.png" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="scroll_bg" ActionTag="-1861644414" Tag="157" IconVisible="False" LeftMargin="30.0000" RightMargin="682.0000" TopMargin="146.0000" BottomMargin="14.0000" LeftEage="187" RightEage="187" TopEage="184" BottomEage="184" Scale9OriginX="187" Scale9OriginY="184" Scale9Width="194" Scale9Height="192" ctype="ImageViewObjectData">
                <Size X="568.0000" Y="560.0000" />
                <AnchorPoint />
                <Position X="30.0000" Y="14.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.0234" Y="0.0194" />
                <PreSize X="0.4437" Y="0.7778" />
                <FileData Type="Normal" Path="CreateAgentRoomUI/room_list_bg.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="playing_room_scroll" ActionTag="502601261" Tag="1392" IconVisible="False" LeftMargin="48.5463" RightMargin="701.4537" TopMargin="161.8158" BottomMargin="28.1842" TouchEnable="True" ClipAble="True" BackColorAlpha="102" ColorAngle="90.0000" LeftEage="187" RightEage="187" TopEage="184" BottomEage="184" Scale9OriginX="-187" Scale9OriginY="-184" Scale9Width="374" Scale9Height="368" ScrollDirectionType="Vertical" ctype="ScrollViewObjectData">
                <Size X="530.0000" Y="530.0000" />
                <Children>
                  <AbstractNodeData Name="playing_panel" ActionTag="1674543883" Tag="1393" IconVisible="False" PositionPercentXEnabled="True" RightMargin="-6.0000" TopMargin="380.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" LeftEage="172" RightEage="172" TopEage="40" BottomEage="40" Scale9OriginX="-172" Scale9OriginY="-40" Scale9Width="344" Scale9Height="80" ctype="PanelObjectData">
                    <Size X="536.0000" Y="150.0000" />
                    <Children>
                      <AbstractNodeData Name="room_info_bg" ActionTag="-641937090" Tag="1409" IconVisible="False" TopMargin="14.0000" LeftEage="176" RightEage="176" TopEage="44" BottomEage="44" Scale9OriginX="176" Scale9OriginY="44" Scale9Width="184" Scale9Height="48" ctype="ImageViewObjectData">
                        <Size X="536.0000" Y="136.0000" />
                        <AnchorPoint />
                        <Position />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition />
                        <PreSize X="1.0000" Y="0.9067" />
                        <FileData Type="Normal" Path="CreateAgentRoomUI/info_bg.png" Plist="" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="room_title_bg" ActionTag="-340942643" Tag="1410" IconVisible="False" PositionPercentXEnabled="True" PercentWidthEnable="True" PercentWidthEnabled="True" TopMargin="-0.6005" BottomMargin="114.6005" LeftEage="123" RightEage="123" TopEage="11" BottomEage="11" Scale9OriginX="123" Scale9OriginY="11" Scale9Width="128" Scale9Height="14" ctype="ImageViewObjectData">
                        <Size X="536.0000" Y="36.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="268.0000" Y="132.6005" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.5000" Y="0.8840" />
                        <PreSize X="1.0000" Y="0.2400" />
                        <FileData Type="Normal" Path="CreateAgentRoomUI/title_bg.png" Plist="" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="player_panel_0" ActionTag="-91674949" Tag="174" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="16.0800" RightMargin="447.9200" TopMargin="46.0000" BottomMargin="30.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" LeftEage="25" RightEage="25" TopEage="25" BottomEage="25" Scale9OriginX="-25" Scale9OriginY="-25" Scale9Width="50" Scale9Height="50" ctype="PanelObjectData">
                        <Size X="72.0000" Y="74.0000" />
                        <Children>
                          <AbstractNodeData Name="icon_img" ActionTag="-1308898301" Tag="175" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" PercentWidthEnable="True" PercentHeightEnable="True" PercentWidthEnabled="True" PercentHeightEnabled="True" LeftEage="33" RightEage="33" TopEage="33" BottomEage="33" Scale9OriginX="33" Scale9OriginY="33" Scale9Width="34" Scale9Height="34" ctype="ImageViewObjectData">
                            <Size X="72.0000" Y="74.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="36.0000" Y="37.0000" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.5000" Y="0.5000" />
                            <PreSize X="1.0000" Y="1.0000" />
                            <FileData Type="Normal" Path="GameHallUI/portrait_sprite.png" Plist="" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="name_bg" ActionTag="1621443884" Tag="176" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" PercentWidthEnable="True" PercentWidthEnabled="True" LeftMargin="-7.2000" RightMargin="-7.2000" TopMargin="49.2700" BottomMargin="-3.2700" Scale9Enable="True" LeftEage="34" RightEage="34" TopEage="9" BottomEage="9" Scale9OriginX="34" Scale9OriginY="9" Scale9Width="22" Scale9Height="10" ctype="ImageViewObjectData">
                            <Size X="86.4000" Y="28.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="36.0000" Y="10.7300" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.5000" Y="0.1450" />
                            <PreSize X="1.2000" Y="0.3784" />
                            <FileData Type="Normal" Path="GameRoomUI/name_bg.png" Plist="" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="name_label" ActionTag="-913617868" Tag="177" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="-4.0000" RightMargin="-4.0000" TopMargin="54.5100" BottomMargin="0.4900" IsCustomSize="True" FontSize="14" LabelText="我我我我我我我" HorizontalAlignmentType="HT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                            <Size X="80.0000" Y="19.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="36.0000" Y="9.9900" />
                            <Scale ScaleX="0.9500" ScaleY="0.9500" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.5000" Y="0.1350" />
                            <PreSize X="1.1111" Y="0.2568" />
                            <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                            <OutlineColor A="255" R="255" G="0" B="0" />
                            <ShadowColor A="255" R="110" G="110" B="110" />
                          </AbstractNodeData>
                        </Children>
                        <AnchorPoint />
                        <Position X="16.0800" Y="30.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.0300" Y="0.2000" />
                        <PreSize X="0.1343" Y="0.4933" />
                        <SingleColor A="255" R="150" G="200" B="255" />
                        <FirstColor A="255" R="150" G="200" B="255" />
                        <EndColor A="255" R="255" G="255" B="255" />
                        <ColorVector ScaleY="1.0000" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="player_panel_1" ActionTag="1087063432" Tag="178" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="96.4800" RightMargin="367.5200" TopMargin="46.0000" BottomMargin="30.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" LeftEage="25" RightEage="25" TopEage="25" BottomEage="25" Scale9OriginX="-25" Scale9OriginY="-25" Scale9Width="50" Scale9Height="50" ctype="PanelObjectData">
                        <Size X="72.0000" Y="74.0000" />
                        <Children>
                          <AbstractNodeData Name="icon_img" ActionTag="759620133" Tag="179" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" PercentWidthEnable="True" PercentHeightEnable="True" PercentWidthEnabled="True" PercentHeightEnabled="True" LeftEage="33" RightEage="33" TopEage="33" BottomEage="33" Scale9OriginX="33" Scale9OriginY="33" Scale9Width="34" Scale9Height="34" ctype="ImageViewObjectData">
                            <Size X="72.0000" Y="74.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="36.0000" Y="37.0000" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.5000" Y="0.5000" />
                            <PreSize X="1.0000" Y="1.0000" />
                            <FileData Type="Normal" Path="GameHallUI/portrait_sprite.png" Plist="" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="name_bg" ActionTag="890713745" Tag="180" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" PercentWidthEnable="True" PercentWidthEnabled="True" LeftMargin="-7.2000" RightMargin="-7.2000" TopMargin="49.2700" BottomMargin="-3.2700" Scale9Enable="True" LeftEage="34" RightEage="34" TopEage="9" BottomEage="9" Scale9OriginX="34" Scale9OriginY="9" Scale9Width="22" Scale9Height="10" ctype="ImageViewObjectData">
                            <Size X="86.4000" Y="28.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="36.0000" Y="10.7300" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.5000" Y="0.1450" />
                            <PreSize X="1.2000" Y="0.3784" />
                            <FileData Type="Normal" Path="GameRoomUI/name_bg.png" Plist="" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="name_label" ActionTag="-1215361723" Tag="181" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="-4.0000" RightMargin="-4.0000" TopMargin="54.5100" BottomMargin="0.4900" IsCustomSize="True" FontSize="14" LabelText="我我我我我我我" HorizontalAlignmentType="HT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                            <Size X="80.0000" Y="19.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="36.0000" Y="9.9900" />
                            <Scale ScaleX="0.9500" ScaleY="0.9500" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.5000" Y="0.1350" />
                            <PreSize X="1.1111" Y="0.2568" />
                            <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                            <OutlineColor A="255" R="255" G="0" B="0" />
                            <ShadowColor A="255" R="110" G="110" B="110" />
                          </AbstractNodeData>
                        </Children>
                        <AnchorPoint />
                        <Position X="96.4800" Y="30.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.1800" Y="0.2000" />
                        <PreSize X="0.1343" Y="0.4933" />
                        <SingleColor A="255" R="150" G="200" B="255" />
                        <FirstColor A="255" R="150" G="200" B="255" />
                        <EndColor A="255" R="255" G="255" B="255" />
                        <ColorVector ScaleY="1.0000" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="player_panel_2" ActionTag="126500162" Tag="182" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="176.8800" RightMargin="287.1200" TopMargin="46.0000" BottomMargin="30.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" LeftEage="25" RightEage="25" TopEage="25" BottomEage="25" Scale9OriginX="-25" Scale9OriginY="-25" Scale9Width="50" Scale9Height="50" ctype="PanelObjectData">
                        <Size X="72.0000" Y="74.0000" />
                        <Children>
                          <AbstractNodeData Name="icon_img" ActionTag="211829121" Tag="183" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" PercentWidthEnable="True" PercentHeightEnable="True" PercentWidthEnabled="True" PercentHeightEnabled="True" LeftEage="33" RightEage="33" TopEage="33" BottomEage="33" Scale9OriginX="33" Scale9OriginY="33" Scale9Width="34" Scale9Height="34" ctype="ImageViewObjectData">
                            <Size X="72.0000" Y="74.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="36.0000" Y="37.0000" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.5000" Y="0.5000" />
                            <PreSize X="1.0000" Y="1.0000" />
                            <FileData Type="Normal" Path="GameHallUI/portrait_sprite.png" Plist="" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="name_bg" ActionTag="969711247" Tag="184" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" PercentWidthEnable="True" PercentWidthEnabled="True" LeftMargin="-7.2000" RightMargin="-7.2000" TopMargin="49.2700" BottomMargin="-3.2700" Scale9Enable="True" LeftEage="34" RightEage="34" TopEage="9" BottomEage="9" Scale9OriginX="34" Scale9OriginY="9" Scale9Width="22" Scale9Height="10" ctype="ImageViewObjectData">
                            <Size X="86.4000" Y="28.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="36.0000" Y="10.7300" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.5000" Y="0.1450" />
                            <PreSize X="1.2000" Y="0.3784" />
                            <FileData Type="Normal" Path="GameRoomUI/name_bg.png" Plist="" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="name_label" ActionTag="452518597" Tag="185" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="-4.0000" RightMargin="-4.0000" TopMargin="54.5100" BottomMargin="0.4900" IsCustomSize="True" FontSize="14" LabelText="我我我我我我我" HorizontalAlignmentType="HT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                            <Size X="80.0000" Y="19.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="36.0000" Y="9.9900" />
                            <Scale ScaleX="0.9500" ScaleY="0.9500" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.5000" Y="0.1350" />
                            <PreSize X="1.1111" Y="0.2568" />
                            <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                            <OutlineColor A="255" R="255" G="0" B="0" />
                            <ShadowColor A="255" R="110" G="110" B="110" />
                          </AbstractNodeData>
                        </Children>
                        <AnchorPoint />
                        <Position X="176.8800" Y="30.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.3300" Y="0.2000" />
                        <PreSize X="0.1343" Y="0.4933" />
                        <SingleColor A="255" R="150" G="200" B="255" />
                        <FirstColor A="255" R="150" G="200" B="255" />
                        <EndColor A="255" R="255" G="255" B="255" />
                        <ColorVector ScaleY="1.0000" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="player_panel_3" ActionTag="-539426035" Tag="186" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="257.2800" RightMargin="206.7200" TopMargin="46.0000" BottomMargin="30.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" LeftEage="25" RightEage="25" TopEage="25" BottomEage="25" Scale9OriginX="-25" Scale9OriginY="-25" Scale9Width="50" Scale9Height="50" ctype="PanelObjectData">
                        <Size X="72.0000" Y="74.0000" />
                        <Children>
                          <AbstractNodeData Name="icon_img" ActionTag="-1879575940" Tag="187" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" PercentWidthEnable="True" PercentHeightEnable="True" PercentWidthEnabled="True" PercentHeightEnabled="True" LeftEage="33" RightEage="33" TopEage="33" BottomEage="33" Scale9OriginX="33" Scale9OriginY="33" Scale9Width="34" Scale9Height="34" ctype="ImageViewObjectData">
                            <Size X="72.0000" Y="74.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="36.0000" Y="37.0000" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.5000" Y="0.5000" />
                            <PreSize X="1.0000" Y="1.0000" />
                            <FileData Type="Normal" Path="GameHallUI/portrait_sprite.png" Plist="" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="name_bg" ActionTag="2046764333" Tag="188" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" PercentWidthEnable="True" PercentWidthEnabled="True" LeftMargin="-7.2000" RightMargin="-7.2000" TopMargin="49.2700" BottomMargin="-3.2700" Scale9Enable="True" LeftEage="34" RightEage="34" TopEage="9" BottomEage="9" Scale9OriginX="34" Scale9OriginY="9" Scale9Width="22" Scale9Height="10" ctype="ImageViewObjectData">
                            <Size X="86.4000" Y="28.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="36.0000" Y="10.7300" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.5000" Y="0.1450" />
                            <PreSize X="1.2000" Y="0.3784" />
                            <FileData Type="Normal" Path="GameRoomUI/name_bg.png" Plist="" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="name_label" ActionTag="1243580632" Tag="189" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="-4.0000" RightMargin="-4.0000" TopMargin="54.5100" BottomMargin="0.4900" IsCustomSize="True" FontSize="14" LabelText="我我我我我我我" HorizontalAlignmentType="HT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                            <Size X="80.0000" Y="19.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="36.0000" Y="9.9900" />
                            <Scale ScaleX="0.9500" ScaleY="0.9500" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.5000" Y="0.1350" />
                            <PreSize X="1.1111" Y="0.2568" />
                            <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                            <OutlineColor A="255" R="255" G="0" B="0" />
                            <ShadowColor A="255" R="110" G="110" B="110" />
                          </AbstractNodeData>
                        </Children>
                        <AnchorPoint />
                        <Position X="257.2800" Y="30.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.4800" Y="0.2000" />
                        <PreSize X="0.1343" Y="0.4933" />
                        <SingleColor A="255" R="150" G="200" B="255" />
                        <FirstColor A="255" R="150" G="200" B="255" />
                        <EndColor A="255" R="255" G="255" B="255" />
                        <ColorVector ScaleY="1.0000" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="room_detail_label" ActionTag="1620916129" Tag="1407" IconVisible="False" LeftMargin="8.0000" RightMargin="6.0000" TopMargin="125.0000" BottomMargin="5.0000" IsCustomSize="True" FontSize="15" LabelText="普通棋牌，无封顶，摸1宝" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="522.0000" Y="20.0000" />
                        <AnchorPoint ScaleY="0.5000" />
                        <Position X="8.0000" Y="15.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="165" G="115" B="77" />
                        <PrePosition X="0.0149" Y="0.1000" />
                        <PreSize X="0.9739" Y="0.1333" />
                        <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="invite_btn" ActionTag="307980713" Tag="1412" IconVisible="False" PositionPercentYEnabled="True" LeftMargin="345.0000" RightMargin="101.0000" TopMargin="48.5000" BottomMargin="33.5000" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="60" Scale9Height="46" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                        <Size X="90.0000" Y="68.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="390.0000" Y="67.5000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.7276" Y="0.4500" />
                        <PreSize X="0.1679" Y="0.4533" />
                        <TextColor A="255" R="65" G="65" B="70" />
                        <NormalFileData Type="Normal" Path="CreateAgentRoomUI/invite_btn.png" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="dismiss_btn" ActionTag="1687371880" Tag="1415" IconVisible="False" PositionPercentYEnabled="True" LeftMargin="452.0000" RightMargin="28.0000" TopMargin="67.5000" BottomMargin="52.5000" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="26" Scale9Height="8" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                        <Size X="56.0000" Y="30.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="480.0000" Y="67.5000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.8955" Y="0.4500" />
                        <PreSize X="0.1045" Y="0.2000" />
                        <TextColor A="255" R="65" G="65" B="70" />
                        <NormalFileData Type="Normal" Path="CreateAgentRoomUI/dismiss_btn.png" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="playing_label" Visible="False" ActionTag="682518172" Tag="1422" IconVisible="False" PositionPercentYEnabled="True" LeftMargin="371.5000" RightMargin="14.5000" TopMargin="61.5000" BottomMargin="61.5000" IsCustomSize="True" FontSize="24" LabelText="游戏中(1/8)" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="150.0000" Y="27.0000" />
                        <AnchorPoint ScaleY="0.5000" />
                        <Position X="371.5000" Y="75.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="165" B="0" />
                        <PrePosition X="0.6931" Y="0.5000" />
                        <PreSize X="0.2799" Y="0.1800" />
                        <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="game_name" ActionTag="-302934137" Tag="1416" IconVisible="False" LeftMargin="10.5000" RightMargin="434.5000" TopMargin="5.5000" BottomMargin="119.5000" FontSize="22" LabelText="义乌棋牌" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="91.0000" Y="25.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="56.0000" Y="132.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="237" G="251" B="220" />
                        <PrePosition X="0.1045" Y="0.8800" />
                        <PreSize X="0.1698" Y="0.1667" />
                        <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="room_id_label" ActionTag="696837863" Tag="1417" IconVisible="False" LeftMargin="108.0000" RightMargin="304.0000" TopMargin="5.5000" BottomMargin="119.5000" FontSize="22" LabelText="房号:888888" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="124.0000" Y="25.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="170.0000" Y="132.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="237" G="251" B="220" />
                        <PrePosition X="0.3172" Y="0.8800" />
                        <PreSize X="0.2313" Y="0.1667" />
                        <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="round_label" ActionTag="-1290063845" Tag="1420" IconVisible="False" LeftMargin="243.0000" RightMargin="213.0000" TopMargin="5.5000" BottomMargin="119.5000" IsCustomSize="True" FontSize="22" LabelText="16局" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="80.0000" Y="25.0000" />
                        <AnchorPoint ScaleY="0.5000" />
                        <Position X="243.0000" Y="132.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="237" G="251" B="220" />
                        <PrePosition X="0.4534" Y="0.8800" />
                        <PreSize X="0.1493" Y="0.1667" />
                        <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint />
                    <Position />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="1.0113" Y="0.2830" />
                    <SingleColor A="255" R="150" G="200" B="255" />
                    <FirstColor A="255" R="150" G="200" B="255" />
                    <EndColor A="255" R="255" G="255" B="255" />
                    <ColorVector ScaleY="1.0000" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint />
                <Position X="48.5463" Y="28.1842" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.0379" Y="0.0391" />
                <PreSize X="0.4141" Y="0.7361" />
                <SingleColor A="255" R="255" G="150" B="100" />
                <FirstColor A="255" R="255" G="150" B="100" />
                <EndColor A="255" R="255" G="255" B="255" />
                <ColorVector ScaleY="1.0000" />
                <InnerNodeSize Width="530" Height="530" />
              </AbstractNodeData>
              <AbstractNodeData Name="complete_room_scroll" Visible="False" ActionTag="300298046" Tag="811" IconVisible="False" LeftMargin="48.5500" RightMargin="701.4500" TopMargin="161.8200" BottomMargin="28.1800" TouchEnable="True" ClipAble="True" BackColorAlpha="102" ComboBoxIndex="1" ColorAngle="90.0000" LeftEage="187" RightEage="187" TopEage="184" BottomEage="184" Scale9OriginX="187" Scale9OriginY="184" Scale9Width="194" Scale9Height="192" ScrollDirectionType="Vertical" ctype="ScrollViewObjectData">
                <Size X="530.0000" Y="530.0000" />
                <Children>
                  <AbstractNodeData Name="complete_panel" ActionTag="-662683800" Tag="838" IconVisible="False" PositionPercentXEnabled="True" RightMargin="-6.0000" TopMargin="380.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" LeftEage="172" RightEage="172" TopEage="40" BottomEage="40" Scale9OriginX="-172" Scale9OriginY="-40" Scale9Width="344" Scale9Height="80" ctype="PanelObjectData">
                    <Size X="536.0000" Y="150.0000" />
                    <Children>
                      <AbstractNodeData Name="room_info_bg" ActionTag="-557417289" Tag="839" IconVisible="False" LeftMargin="0.8648" RightMargin="-0.8648" TopMargin="14.0000" LeftEage="176" RightEage="176" TopEage="44" BottomEage="44" Scale9OriginX="176" Scale9OriginY="44" Scale9Width="184" Scale9Height="48" ctype="ImageViewObjectData">
                        <Size X="536.0000" Y="136.0000" />
                        <AnchorPoint />
                        <Position X="0.8648" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.0016" />
                        <PreSize X="1.0000" Y="0.9067" />
                        <FileData Type="Normal" Path="CreateAgentRoomUI/info_bg.png" Plist="" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="room_title_bg" ActionTag="-696361224" Tag="840" IconVisible="False" PositionPercentXEnabled="True" PercentWidthEnable="True" PercentWidthEnabled="True" BottomMargin="114.0000" LeftEage="123" RightEage="123" TopEage="11" BottomEage="11" Scale9OriginX="123" Scale9OriginY="11" Scale9Width="128" Scale9Height="14" ctype="ImageViewObjectData">
                        <Size X="536.0000" Y="36.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="268.0000" Y="132.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.5000" Y="0.8800" />
                        <PreSize X="1.0000" Y="0.2400" />
                        <FileData Type="Normal" Path="CreateAgentRoomUI/title_bg.png" Plist="" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="player_panel_0" ActionTag="-1382305364" Tag="190" IconVisible="False" PositionPercentXEnabled="True" LeftMargin="53.6000" RightMargin="410.4000" TopMargin="55.0000" BottomMargin="21.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" LeftEage="25" RightEage="25" TopEage="25" BottomEage="25" Scale9OriginX="-25" Scale9OriginY="-25" Scale9Width="50" Scale9Height="50" ctype="PanelObjectData">
                        <Size X="72.0000" Y="74.0000" />
                        <Children>
                          <AbstractNodeData Name="icon_img" ActionTag="-747180093" Tag="191" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" PercentWidthEnable="True" PercentHeightEnable="True" PercentWidthEnabled="True" PercentHeightEnabled="True" LeftEage="33" RightEage="33" TopEage="33" BottomEage="33" Scale9OriginX="33" Scale9OriginY="33" Scale9Width="34" Scale9Height="34" ctype="ImageViewObjectData">
                            <Size X="72.0000" Y="74.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="36.0000" Y="37.0000" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.5000" Y="0.5000" />
                            <PreSize X="1.0000" Y="1.0000" />
                            <FileData Type="Normal" Path="GameHallUI/portrait_sprite.png" Plist="" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="name_bg" ActionTag="-1006047593" Tag="192" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" PercentWidthEnable="True" PercentWidthEnabled="True" LeftMargin="-7.2000" RightMargin="-7.2000" TopMargin="49.2700" BottomMargin="-3.2700" Scale9Enable="True" LeftEage="34" RightEage="34" TopEage="9" BottomEage="9" Scale9OriginX="34" Scale9OriginY="9" Scale9Width="22" Scale9Height="10" ctype="ImageViewObjectData">
                            <Size X="86.4000" Y="28.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="36.0000" Y="10.7300" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.5000" Y="0.1450" />
                            <PreSize X="1.2000" Y="0.3784" />
                            <FileData Type="Normal" Path="GameRoomUI/name_bg.png" Plist="" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="score" ActionTag="-1239370150" Tag="193" IconVisible="False" PositionPercentXEnabled="True" LeftMargin="11.0000" RightMargin="11.0000" TopMargin="74.0000" BottomMargin="-18.0000" IsCustomSize="True" FontSize="16" LabelText="+9999" HorizontalAlignmentType="HT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                            <Size X="50.0000" Y="18.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="36.0000" Y="-9.0000" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="0" B="0" />
                            <PrePosition X="0.5000" Y="-0.1216" />
                            <PreSize X="0.6944" Y="0.2432" />
                            <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                            <OutlineColor A="255" R="255" G="0" B="0" />
                            <ShadowColor A="255" R="110" G="110" B="110" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="name_label" ActionTag="1101771751" Tag="194" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="-4.0000" RightMargin="-4.0000" TopMargin="54.5100" BottomMargin="0.4900" IsCustomSize="True" FontSize="14" LabelText="我我我我我我我" HorizontalAlignmentType="HT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                            <Size X="80.0000" Y="19.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="36.0000" Y="9.9900" />
                            <Scale ScaleX="0.9500" ScaleY="0.9500" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.5000" Y="0.1350" />
                            <PreSize X="1.1111" Y="0.2568" />
                            <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                            <OutlineColor A="255" R="255" G="0" B="0" />
                            <ShadowColor A="255" R="110" G="110" B="110" />
                          </AbstractNodeData>
                        </Children>
                        <AnchorPoint />
                        <Position X="53.6000" Y="21.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.1000" Y="0.1400" />
                        <PreSize X="0.1343" Y="0.4933" />
                        <SingleColor A="255" R="150" G="200" B="255" />
                        <FirstColor A="255" R="150" G="200" B="255" />
                        <EndColor A="255" R="255" G="255" B="255" />
                        <ColorVector ScaleY="1.0000" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="player_panel_1" ActionTag="-1208033707" Tag="195" IconVisible="False" PositionPercentXEnabled="True" LeftMargin="171.5200" RightMargin="292.4800" TopMargin="55.0000" BottomMargin="21.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" LeftEage="25" RightEage="25" TopEage="25" BottomEage="25" Scale9OriginX="-25" Scale9OriginY="-25" Scale9Width="50" Scale9Height="50" ctype="PanelObjectData">
                        <Size X="72.0000" Y="74.0000" />
                        <Children>
                          <AbstractNodeData Name="icon_img" ActionTag="-600463311" Tag="196" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" PercentWidthEnable="True" PercentHeightEnable="True" PercentWidthEnabled="True" PercentHeightEnabled="True" LeftEage="33" RightEage="33" TopEage="33" BottomEage="33" Scale9OriginX="33" Scale9OriginY="33" Scale9Width="34" Scale9Height="34" ctype="ImageViewObjectData">
                            <Size X="72.0000" Y="74.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="36.0000" Y="37.0000" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.5000" Y="0.5000" />
                            <PreSize X="1.0000" Y="1.0000" />
                            <FileData Type="Normal" Path="GameHallUI/portrait_sprite.png" Plist="" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="name_bg" ActionTag="-1147521290" Tag="197" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" PercentWidthEnable="True" PercentWidthEnabled="True" LeftMargin="-7.2000" RightMargin="-7.2000" TopMargin="49.2700" BottomMargin="-3.2700" Scale9Enable="True" LeftEage="34" RightEage="34" TopEage="9" BottomEage="9" Scale9OriginX="34" Scale9OriginY="9" Scale9Width="22" Scale9Height="10" ctype="ImageViewObjectData">
                            <Size X="86.4000" Y="28.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="36.0000" Y="10.7300" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.5000" Y="0.1450" />
                            <PreSize X="1.2000" Y="0.3784" />
                            <FileData Type="Normal" Path="GameRoomUI/name_bg.png" Plist="" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="score" ActionTag="-533698806" Tag="198" IconVisible="False" PositionPercentXEnabled="True" LeftMargin="11.0000" RightMargin="11.0000" TopMargin="74.0000" BottomMargin="-18.0000" IsCustomSize="True" FontSize="16" LabelText="+9999" HorizontalAlignmentType="HT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                            <Size X="50.0000" Y="18.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="36.0000" Y="-9.0000" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="0" B="0" />
                            <PrePosition X="0.5000" Y="-0.1216" />
                            <PreSize X="0.6944" Y="0.2432" />
                            <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                            <OutlineColor A="255" R="255" G="0" B="0" />
                            <ShadowColor A="255" R="110" G="110" B="110" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="name_label" ActionTag="-1259663013" Tag="199" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="-4.0000" RightMargin="-4.0000" TopMargin="54.5100" BottomMargin="0.4900" IsCustomSize="True" FontSize="14" LabelText="我我我我我我我" HorizontalAlignmentType="HT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                            <Size X="80.0000" Y="19.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="36.0000" Y="9.9900" />
                            <Scale ScaleX="0.9500" ScaleY="0.9500" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.5000" Y="0.1350" />
                            <PreSize X="1.1111" Y="0.2568" />
                            <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                            <OutlineColor A="255" R="255" G="0" B="0" />
                            <ShadowColor A="255" R="110" G="110" B="110" />
                          </AbstractNodeData>
                        </Children>
                        <AnchorPoint />
                        <Position X="171.5200" Y="21.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.3200" Y="0.1400" />
                        <PreSize X="0.1343" Y="0.4933" />
                        <SingleColor A="255" R="150" G="200" B="255" />
                        <FirstColor A="255" R="150" G="200" B="255" />
                        <EndColor A="255" R="255" G="255" B="255" />
                        <ColorVector ScaleY="1.0000" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="player_panel_2" ActionTag="-25809921" Tag="200" IconVisible="False" PositionPercentXEnabled="True" LeftMargin="289.4400" RightMargin="174.5600" TopMargin="55.0000" BottomMargin="21.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" LeftEage="25" RightEage="25" TopEage="25" BottomEage="25" Scale9OriginX="-25" Scale9OriginY="-25" Scale9Width="50" Scale9Height="50" ctype="PanelObjectData">
                        <Size X="72.0000" Y="74.0000" />
                        <Children>
                          <AbstractNodeData Name="icon_img" ActionTag="-269565376" Tag="201" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" PercentWidthEnable="True" PercentHeightEnable="True" PercentWidthEnabled="True" PercentHeightEnabled="True" LeftEage="33" RightEage="33" TopEage="33" BottomEage="33" Scale9OriginX="33" Scale9OriginY="33" Scale9Width="34" Scale9Height="34" ctype="ImageViewObjectData">
                            <Size X="72.0000" Y="74.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="36.0000" Y="37.0000" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.5000" Y="0.5000" />
                            <PreSize X="1.0000" Y="1.0000" />
                            <FileData Type="Normal" Path="GameHallUI/portrait_sprite.png" Plist="" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="name_bg" ActionTag="390387376" Tag="202" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" PercentWidthEnable="True" PercentWidthEnabled="True" LeftMargin="-7.2000" RightMargin="-7.2000" TopMargin="49.2700" BottomMargin="-3.2700" Scale9Enable="True" LeftEage="34" RightEage="34" TopEage="9" BottomEage="9" Scale9OriginX="34" Scale9OriginY="9" Scale9Width="22" Scale9Height="10" ctype="ImageViewObjectData">
                            <Size X="86.4000" Y="28.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="36.0000" Y="10.7300" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.5000" Y="0.1450" />
                            <PreSize X="1.2000" Y="0.3784" />
                            <FileData Type="Normal" Path="GameRoomUI/name_bg.png" Plist="" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="score" ActionTag="-1505150401" Tag="203" IconVisible="False" PositionPercentXEnabled="True" LeftMargin="11.0000" RightMargin="11.0000" TopMargin="74.0000" BottomMargin="-18.0000" IsCustomSize="True" FontSize="16" LabelText="+9999" HorizontalAlignmentType="HT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                            <Size X="50.0000" Y="18.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="36.0000" Y="-9.0000" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="0" G="128" B="0" />
                            <PrePosition X="0.5000" Y="-0.1216" />
                            <PreSize X="0.6944" Y="0.2432" />
                            <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                            <OutlineColor A="255" R="255" G="0" B="0" />
                            <ShadowColor A="255" R="110" G="110" B="110" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="name_label" ActionTag="-23178699" Tag="204" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="-4.0000" RightMargin="-4.0000" TopMargin="54.5100" BottomMargin="0.4900" IsCustomSize="True" FontSize="14" LabelText="我我我我我我我" HorizontalAlignmentType="HT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                            <Size X="80.0000" Y="19.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="36.0000" Y="9.9900" />
                            <Scale ScaleX="0.9500" ScaleY="0.9500" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.5000" Y="0.1350" />
                            <PreSize X="1.1111" Y="0.2568" />
                            <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                            <OutlineColor A="255" R="255" G="0" B="0" />
                            <ShadowColor A="255" R="110" G="110" B="110" />
                          </AbstractNodeData>
                        </Children>
                        <AnchorPoint />
                        <Position X="289.4400" Y="21.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.5400" Y="0.1400" />
                        <PreSize X="0.1343" Y="0.4933" />
                        <SingleColor A="255" R="150" G="200" B="255" />
                        <FirstColor A="255" R="150" G="200" B="255" />
                        <EndColor A="255" R="255" G="255" B="255" />
                        <ColorVector ScaleY="1.0000" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="player_panel_3" ActionTag="-31317813" Tag="205" IconVisible="False" PositionPercentXEnabled="True" LeftMargin="407.3600" RightMargin="56.6400" TopMargin="55.0000" BottomMargin="21.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" LeftEage="25" RightEage="25" TopEage="25" BottomEage="25" Scale9OriginX="-25" Scale9OriginY="-25" Scale9Width="50" Scale9Height="50" ctype="PanelObjectData">
                        <Size X="72.0000" Y="74.0000" />
                        <Children>
                          <AbstractNodeData Name="icon_img" ActionTag="803053275" Tag="206" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" PercentWidthEnable="True" PercentHeightEnable="True" PercentWidthEnabled="True" PercentHeightEnabled="True" LeftEage="33" RightEage="33" TopEage="33" BottomEage="33" Scale9OriginX="33" Scale9OriginY="33" Scale9Width="34" Scale9Height="34" ctype="ImageViewObjectData">
                            <Size X="72.0000" Y="74.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="36.0000" Y="37.0000" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.5000" Y="0.5000" />
                            <PreSize X="1.0000" Y="1.0000" />
                            <FileData Type="Normal" Path="GameHallUI/portrait_sprite.png" Plist="" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="name_bg" ActionTag="1801304744" Tag="207" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" PercentWidthEnable="True" PercentWidthEnabled="True" LeftMargin="-7.2000" RightMargin="-7.2000" TopMargin="49.2700" BottomMargin="-3.2700" Scale9Enable="True" LeftEage="34" RightEage="34" TopEage="9" BottomEage="9" Scale9OriginX="34" Scale9OriginY="9" Scale9Width="22" Scale9Height="10" ctype="ImageViewObjectData">
                            <Size X="86.4000" Y="28.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="36.0000" Y="10.7300" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.5000" Y="0.1450" />
                            <PreSize X="1.2000" Y="0.3784" />
                            <FileData Type="Normal" Path="GameRoomUI/name_bg.png" Plist="" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="score" ActionTag="658239877" Tag="208" IconVisible="False" PositionPercentXEnabled="True" LeftMargin="11.0000" RightMargin="11.0000" TopMargin="74.0000" BottomMargin="-18.0000" IsCustomSize="True" FontSize="16" LabelText="+9999" HorizontalAlignmentType="HT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                            <Size X="50.0000" Y="18.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="36.0000" Y="-9.0000" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="0" G="128" B="0" />
                            <PrePosition X="0.5000" Y="-0.1216" />
                            <PreSize X="0.6944" Y="0.2432" />
                            <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                            <OutlineColor A="255" R="255" G="0" B="0" />
                            <ShadowColor A="255" R="110" G="110" B="110" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="name_label" ActionTag="808467013" Tag="209" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="-4.0000" RightMargin="-4.0000" TopMargin="54.5100" BottomMargin="0.4900" IsCustomSize="True" FontSize="14" LabelText="我我我我我我我" HorizontalAlignmentType="HT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                            <Size X="80.0000" Y="19.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="36.0000" Y="9.9900" />
                            <Scale ScaleX="0.9500" ScaleY="0.9500" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.5000" Y="0.1350" />
                            <PreSize X="1.1111" Y="0.2568" />
                            <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                            <OutlineColor A="255" R="255" G="0" B="0" />
                            <ShadowColor A="255" R="110" G="110" B="110" />
                          </AbstractNodeData>
                        </Children>
                        <AnchorPoint />
                        <Position X="407.3600" Y="21.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.7600" Y="0.1400" />
                        <PreSize X="0.1343" Y="0.4933" />
                        <SingleColor A="255" R="150" G="200" B="255" />
                        <FirstColor A="255" R="150" G="200" B="255" />
                        <EndColor A="255" R="255" G="255" B="255" />
                        <ColorVector ScaleY="1.0000" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="room_detail_label" ActionTag="1796560992" Tag="861" IconVisible="False" LeftMargin="8.0000" RightMargin="6.0000" TopMargin="34.9995" BottomMargin="95.0005" IsCustomSize="True" FontSize="16" LabelText="普通棋牌，无封顶，摸1宝" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="522.0000" Y="20.0000" />
                        <AnchorPoint ScaleY="0.5000" />
                        <Position X="8.0000" Y="105.0005" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="165" G="115" B="77" />
                        <PrePosition X="0.0149" Y="0.7000" />
                        <PreSize X="0.9739" Y="0.1333" />
                        <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="game_name" ActionTag="-2125932625" Tag="862" IconVisible="False" LeftMargin="10.5000" RightMargin="434.5000" TopMargin="5.5000" BottomMargin="119.5000" FontSize="22" LabelText="义乌棋牌" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="91.0000" Y="25.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="56.0000" Y="132.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="237" G="251" B="220" />
                        <PrePosition X="0.1045" Y="0.8800" />
                        <PreSize X="0.1698" Y="0.1667" />
                        <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="room_id_label" ActionTag="-1721937905" Tag="863" IconVisible="False" LeftMargin="108.0000" RightMargin="304.0000" TopMargin="5.5000" BottomMargin="119.5000" FontSize="22" LabelText="房号:888888" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="124.0000" Y="25.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="170.0000" Y="132.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="237" G="251" B="220" />
                        <PrePosition X="0.3172" Y="0.8800" />
                        <PreSize X="0.2313" Y="0.1667" />
                        <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="round_label" ActionTag="68283621" Tag="864" IconVisible="False" LeftMargin="241.6600" RightMargin="224.3400" TopMargin="5.5000" BottomMargin="119.5000" IsCustomSize="True" FontSize="22" LabelText="16局" HorizontalAlignmentType="HT_Center" VerticalAlignmentType="VT_Center" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="70.0000" Y="25.0000" />
                        <AnchorPoint ScaleY="0.5000" />
                        <Position X="241.6600" Y="132.0000" />
                        <Scale ScaleX="1.0610" ScaleY="1.0000" />
                        <CColor A="255" R="237" G="251" B="220" />
                        <PrePosition X="0.4509" Y="0.8800" />
                        <PreSize X="0.1306" Y="0.1667" />
                        <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="time_label" ActionTag="1663449936" Tag="865" IconVisible="False" LeftMargin="320.5000" RightMargin="36.5000" TopMargin="6.5000" BottomMargin="120.5000" FontSize="20" LabelText="2018-01-19 09:30:41" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="179.0000" Y="23.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="410.0000" Y="132.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="237" G="251" B="220" />
                        <PrePosition X="0.7649" Y="0.8800" />
                        <PreSize X="0.3340" Y="0.1533" />
                        <FontResource Type="Normal" Path="font/zhunyuan.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint />
                    <Position />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="1.0113" Y="0.2830" />
                    <SingleColor A="255" R="150" G="200" B="255" />
                    <FirstColor A="255" R="150" G="200" B="255" />
                    <EndColor A="255" R="255" G="255" B="255" />
                    <ColorVector ScaleY="1.0000" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint />
                <Position X="48.5500" Y="28.1800" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.0379" Y="0.0391" />
                <PreSize X="0.4141" Y="0.7361" />
                <FileData Type="Normal" Path="CreateAgentRoomUI/room_list_bg.png" Plist="" />
                <SingleColor A="255" R="255" G="150" B="100" />
                <FirstColor A="255" R="255" G="150" B="100" />
                <EndColor A="255" R="255" G="255" B="255" />
                <ColorVector ScaleY="1.0000" />
                <InnerNodeSize Width="530" Height="530" />
              </AbstractNodeData>
              <AbstractNodeData Name="refresh_btn" ActionTag="1615289017" Tag="1414" IconVisible="False" LeftMargin="519.0000" RightMargin="709.0000" TopMargin="94.0000" BottomMargin="574.0000" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="22" Scale9Height="30" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                <Size X="52.0000" Y="52.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="545.0000" Y="600.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.4258" Y="0.8333" />
                <PreSize X="0.0406" Y="0.0722" />
                <TextColor A="255" R="65" G="65" B="70" />
                <NormalFileData Type="Normal" Path="CreateAgentRoomUI/refresh_btn.png" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
            </Children>
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="640.0000" Y="360.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.5000" Y="0.5000" />
            <PreSize X="1.0000" Y="1.0000" />
            <FileData Type="Normal" Path="CreateAgentRoomUI/bg_panel.png" Plist="" />
            <SingleColor A="255" R="0" G="0" B="0" />
            <FirstColor A="255" R="150" G="200" B="255" />
            <EndColor A="255" R="255" G="255" B="255" />
            <ColorVector ScaleY="1.0000" />
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>