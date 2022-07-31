<?xml version="1.0" encoding="UTF-8" standalone="yes" ?>
<!DOCTYPE boost_serialization>
<boost_serialization signature="serialization::archive" version="17">
  <syndb class_id="0" tracking_level="0" version="0">
    <userIPLatency>-1</userIPLatency>
    <userIPName/>
    <cdfg class_id="1" tracking_level="1" version="0" object_id="_0">
      <name>accelerator</name>
      <module_structure>Dataflow</module_structure>
      <ret_bitwidth>0</ret_bitwidth>
      <ports class_id="2" tracking_level="0" version="0">
        <count>2</count>
        <item_version>0</item_version>
        <item class_id="3" tracking_level="1" version="0" object_id="_1">
          <Value class_id="4" tracking_level="0" version="0">
            <Obj class_id="5" tracking_level="0" version="0">
              <type>1</type>
              <id>1</id>
              <name>In_r</name>
              <fileName/>
              <fileDirectory/>
              <lineNumber>0</lineNumber>
              <contextFuncName/>
              <contextNormFuncName/>
              <inlineStackInfo class_id="6" tracking_level="0" version="0">
                <count>0</count>
                <item_version>0</item_version>
              </inlineStackInfo>
              <originalName/>
              <rtlName/>
              <control/>
              <opType/>
              <implIndex/>
              <coreName/>
              <isStorage>0</isStorage>
              <storageDepth>0</storageDepth>
              <coreId>0</coreId>
              <rtlModuleName/>
            </Obj>
            <bitwidth>8</bitwidth>
          </Value>
          <direction>0</direction>
          <if_type>3</if_type>
          <array_size>0</array_size>
          <bit_vecs class_id="7" tracking_level="0" version="0">
            <count>0</count>
            <item_version>0</item_version>
          </bit_vecs>
        </item>
        <item class_id_reference="3" object_id="_2">
          <Value>
            <Obj>
              <type>1</type>
              <id>2</id>
              <name>Out_r</name>
              <fileName/>
              <fileDirectory/>
              <lineNumber>0</lineNumber>
              <contextFuncName/>
              <contextNormFuncName/>
              <inlineStackInfo>
                <count>0</count>
                <item_version>0</item_version>
              </inlineStackInfo>
              <originalName/>
              <rtlName/>
              <control/>
              <opType/>
              <implIndex/>
              <coreName/>
              <isStorage>0</isStorage>
              <storageDepth>0</storageDepth>
              <coreId>0</coreId>
              <rtlModuleName/>
            </Obj>
            <bitwidth>32</bitwidth>
          </Value>
          <direction>1</direction>
          <if_type>3</if_type>
          <array_size>0</array_size>
          <bit_vecs>
            <count>0</count>
            <item_version>0</item_version>
          </bit_vecs>
        </item>
      </ports>
      <nodes class_id="8" tracking_level="0" version="0">
        <count>4</count>
        <item_version>0</item_version>
        <item class_id="9" tracking_level="1" version="0" object_id="_3">
          <Value>
            <Obj>
              <type>0</type>
              <id>10</id>
              <name>appear</name>
              <fileName>byte_count_stream/src/byte_count_stream.cpp</fileName>
              <fileDirectory>..</fileDirectory>
              <lineNumber>10</lineNumber>
              <contextFuncName>accelerator</contextFuncName>
              <contextNormFuncName>accelerator</contextNormFuncName>
              <inlineStackInfo>
                <count>1</count>
                <item_version>0</item_version>
                <item class_id="10" tracking_level="0" version="0">
                  <first>E:\estimation_accel\hls</first>
                  <second class_id="11" tracking_level="0" version="0">
                    <count>1</count>
                    <item_version>0</item_version>
                    <item class_id="12" tracking_level="0" version="0">
                      <first class_id="13" tracking_level="0" version="0">
                        <first>byte_count_stream/src/byte_count_stream.cpp</first>
                        <second>accelerator</second>
                      </first>
                      <second>10</second>
                    </item>
                  </second>
                </item>
              </inlineStackInfo>
              <originalName>appear</originalName>
              <rtlName>appear_U</rtlName>
              <control>auto</control>
              <opType>ram_t2p</opType>
              <implIndex>auto</implIndex>
              <coreName>RAM</coreName>
              <isStorage>1</isStorage>
              <storageDepth>256</storageDepth>
              <coreId>82</coreId>
              <rtlModuleName>accelerator_appear_RAM_AUTO_1R1W</rtlModuleName>
            </Obj>
            <bitwidth>8</bitwidth>
          </Value>
          <oprand_edges>
            <count>1</count>
            <item_version>0</item_version>
            <item>16</item>
          </oprand_edges>
          <opcode>alloca</opcode>
          <m_Display>0</m_Display>
          <m_isOnCriticalPath>0</m_isOnCriticalPath>
          <m_isLCDNode>0</m_isLCDNode>
          <m_isStartOfPath>0</m_isStartOfPath>
          <m_delay>0.00</m_delay>
          <m_topoIndex>1</m_topoIndex>
          <m_clusterGroupNumber>-1</m_clusterGroupNumber>
        </item>
        <item class_id_reference="9" object_id="_4">
          <Value>
            <Obj>
              <type>0</type>
              <id>11</id>
              <name>_ln12</name>
              <fileName>byte_count_stream/src/byte_count_stream.cpp</fileName>
              <fileDirectory>..</fileDirectory>
              <lineNumber>12</lineNumber>
              <contextFuncName>accelerator</contextFuncName>
              <contextNormFuncName>accelerator</contextNormFuncName>
              <inlineStackInfo>
                <count>1</count>
                <item_version>0</item_version>
                <item>
                  <first>E:\estimation_accel\hls</first>
                  <second>
                    <count>1</count>
                    <item_version>0</item_version>
                    <item>
                      <first>
                        <first>byte_count_stream/src/byte_count_stream.cpp</first>
                        <second>accelerator</second>
                      </first>
                      <second>12</second>
                    </item>
                  </second>
                </item>
              </inlineStackInfo>
              <originalName/>
              <rtlName>count_U0</rtlName>
              <control/>
              <opType/>
              <implIndex/>
              <coreName/>
              <isStorage>0</isStorage>
              <storageDepth>0</storageDepth>
              <coreId>3894135184</coreId>
              <rtlModuleName/>
            </Obj>
            <bitwidth>0</bitwidth>
          </Value>
          <oprand_edges>
            <count>3</count>
            <item_version>0</item_version>
            <item>18</item>
            <item>19</item>
            <item>20</item>
          </oprand_edges>
          <opcode>call</opcode>
          <m_Display>0</m_Display>
          <m_isOnCriticalPath>0</m_isOnCriticalPath>
          <m_isLCDNode>0</m_isLCDNode>
          <m_isStartOfPath>0</m_isStartOfPath>
          <m_delay>0.00</m_delay>
          <m_topoIndex>2</m_topoIndex>
          <m_clusterGroupNumber>-1</m_clusterGroupNumber>
        </item>
        <item class_id_reference="9" object_id="_5">
          <Value>
            <Obj>
              <type>0</type>
              <id>12</id>
              <name>_ln13</name>
              <fileName>byte_count_stream/src/byte_count_stream.cpp</fileName>
              <fileDirectory>..</fileDirectory>
              <lineNumber>13</lineNumber>
              <contextFuncName>accelerator</contextFuncName>
              <contextNormFuncName>accelerator</contextNormFuncName>
              <inlineStackInfo>
                <count>1</count>
                <item_version>0</item_version>
                <item>
                  <first>E:\estimation_accel\hls</first>
                  <second>
                    <count>1</count>
                    <item_version>0</item_version>
                    <item>
                      <first>
                        <first>byte_count_stream/src/byte_count_stream.cpp</first>
                        <second>accelerator</second>
                      </first>
                      <second>13</second>
                    </item>
                  </second>
                </item>
              </inlineStackInfo>
              <originalName/>
              <rtlName>threshold_U0</rtlName>
              <control/>
              <opType/>
              <implIndex/>
              <coreName/>
              <isStorage>0</isStorage>
              <storageDepth>0</storageDepth>
              <coreId>3894310176</coreId>
              <rtlModuleName/>
            </Obj>
            <bitwidth>0</bitwidth>
          </Value>
          <oprand_edges>
            <count>5</count>
            <item_version>0</item_version>
            <item>22</item>
            <item>23</item>
            <item>24</item>
            <item>102</item>
            <item>103</item>
          </oprand_edges>
          <opcode>call</opcode>
          <m_Display>0</m_Display>
          <m_isOnCriticalPath>0</m_isOnCriticalPath>
          <m_isLCDNode>0</m_isLCDNode>
          <m_isStartOfPath>0</m_isStartOfPath>
          <m_delay>0.00</m_delay>
          <m_topoIndex>3</m_topoIndex>
          <m_clusterGroupNumber>-1</m_clusterGroupNumber>
        </item>
        <item class_id_reference="9" object_id="_6">
          <Value>
            <Obj>
              <type>0</type>
              <id>13</id>
              <name>_ln14</name>
              <fileName>byte_count_stream/src/byte_count_stream.cpp</fileName>
              <fileDirectory>..</fileDirectory>
              <lineNumber>14</lineNumber>
              <contextFuncName>accelerator</contextFuncName>
              <contextNormFuncName>accelerator</contextNormFuncName>
              <inlineStackInfo>
                <count>1</count>
                <item_version>0</item_version>
                <item>
                  <first>E:\estimation_accel\hls</first>
                  <second>
                    <count>1</count>
                    <item_version>0</item_version>
                    <item>
                      <first>
                        <first>byte_count_stream/src/byte_count_stream.cpp</first>
                        <second>accelerator</second>
                      </first>
                      <second>14</second>
                    </item>
                  </second>
                </item>
              </inlineStackInfo>
              <originalName/>
              <rtlName/>
              <control/>
              <opType/>
              <implIndex/>
              <coreName/>
              <isStorage>0</isStorage>
              <storageDepth>0</storageDepth>
              <coreId>0</coreId>
              <rtlModuleName/>
            </Obj>
            <bitwidth>0</bitwidth>
          </Value>
          <oprand_edges>
            <count>0</count>
            <item_version>0</item_version>
          </oprand_edges>
          <opcode>ret</opcode>
          <m_Display>0</m_Display>
          <m_isOnCriticalPath>0</m_isOnCriticalPath>
          <m_isLCDNode>0</m_isLCDNode>
          <m_isStartOfPath>0</m_isStartOfPath>
          <m_delay>0.00</m_delay>
          <m_topoIndex>4</m_topoIndex>
          <m_clusterGroupNumber>-1</m_clusterGroupNumber>
        </item>
      </nodes>
      <consts class_id="15" tracking_level="0" version="0">
        <count>3</count>
        <item_version>0</item_version>
        <item class_id="16" tracking_level="1" version="0" object_id="_7">
          <Value>
            <Obj>
              <type>2</type>
              <id>15</id>
              <name>empty</name>
              <fileName/>
              <fileDirectory/>
              <lineNumber>0</lineNumber>
              <contextFuncName/>
              <contextNormFuncName/>
              <inlineStackInfo>
                <count>0</count>
                <item_version>0</item_version>
              </inlineStackInfo>
              <originalName/>
              <rtlName/>
              <control/>
              <opType/>
              <implIndex/>
              <coreName/>
              <isStorage>0</isStorage>
              <storageDepth>0</storageDepth>
              <coreId>543515759</coreId>
              <rtlModuleName/>
            </Obj>
            <bitwidth>32</bitwidth>
          </Value>
          <const_type>0</const_type>
          <content>1</content>
        </item>
        <item class_id_reference="16" object_id="_8">
          <Value>
            <Obj>
              <type>2</type>
              <id>17</id>
              <name>count</name>
              <fileName/>
              <fileDirectory/>
              <lineNumber>0</lineNumber>
              <contextFuncName/>
              <contextNormFuncName/>
              <inlineStackInfo>
                <count>0</count>
                <item_version>0</item_version>
              </inlineStackInfo>
              <originalName/>
              <rtlName/>
              <control/>
              <opType/>
              <implIndex/>
              <coreName/>
              <isStorage>0</isStorage>
              <storageDepth>0</storageDepth>
              <coreId>1702129263</coreId>
              <rtlModuleName/>
            </Obj>
            <bitwidth>0</bitwidth>
          </Value>
          <const_type>6</const_type>
          <content>&lt;constant:count&gt;</content>
        </item>
        <item class_id_reference="16" object_id="_9">
          <Value>
            <Obj>
              <type>2</type>
              <id>21</id>
              <name>threshold</name>
              <fileName/>
              <fileDirectory/>
              <lineNumber>0</lineNumber>
              <contextFuncName/>
              <contextNormFuncName/>
              <inlineStackInfo>
                <count>0</count>
                <item_version>0</item_version>
              </inlineStackInfo>
              <originalName/>
              <rtlName/>
              <control/>
              <opType/>
              <implIndex/>
              <coreName/>
              <isStorage>0</isStorage>
              <storageDepth>0</storageDepth>
              <coreId>1528853351</coreId>
              <rtlModuleName/>
            </Obj>
            <bitwidth>0</bitwidth>
          </Value>
          <const_type>6</const_type>
          <content>&lt;constant:threshold&gt;</content>
        </item>
      </consts>
      <blocks class_id="17" tracking_level="0" version="0">
        <count>1</count>
        <item_version>0</item_version>
        <item class_id="18" tracking_level="1" version="0" object_id="_10">
          <Obj>
            <type>3</type>
            <id>14</id>
            <name>accelerator</name>
            <fileName/>
            <fileDirectory/>
            <lineNumber>0</lineNumber>
            <contextFuncName/>
            <contextNormFuncName/>
            <inlineStackInfo>
              <count>0</count>
              <item_version>0</item_version>
            </inlineStackInfo>
            <originalName/>
            <rtlName/>
            <control/>
            <opType/>
            <implIndex/>
            <coreName/>
            <isStorage>0</isStorage>
            <storageDepth>0</storageDepth>
            <coreId>4294967288</coreId>
            <rtlModuleName/>
          </Obj>
          <node_objs>
            <count>4</count>
            <item_version>0</item_version>
            <item>10</item>
            <item>11</item>
            <item>12</item>
            <item>13</item>
          </node_objs>
        </item>
      </blocks>
      <edges class_id="19" tracking_level="0" version="0">
        <count>9</count>
        <item_version>0</item_version>
        <item class_id="20" tracking_level="1" version="0" object_id="_11">
          <id>16</id>
          <edge_type>1</edge_type>
          <source_obj>15</source_obj>
          <sink_obj>10</sink_obj>
          <is_back_edge>0</is_back_edge>
        </item>
        <item class_id_reference="20" object_id="_12">
          <id>18</id>
          <edge_type>1</edge_type>
          <source_obj>17</source_obj>
          <sink_obj>11</sink_obj>
          <is_back_edge>0</is_back_edge>
        </item>
        <item class_id_reference="20" object_id="_13">
          <id>19</id>
          <edge_type>1</edge_type>
          <source_obj>1</source_obj>
          <sink_obj>11</sink_obj>
          <is_back_edge>0</is_back_edge>
        </item>
        <item class_id_reference="20" object_id="_14">
          <id>20</id>
          <edge_type>1</edge_type>
          <source_obj>10</source_obj>
          <sink_obj>11</sink_obj>
          <is_back_edge>0</is_back_edge>
        </item>
        <item class_id_reference="20" object_id="_15">
          <id>22</id>
          <edge_type>1</edge_type>
          <source_obj>21</source_obj>
          <sink_obj>12</sink_obj>
          <is_back_edge>0</is_back_edge>
        </item>
        <item class_id_reference="20" object_id="_16">
          <id>23</id>
          <edge_type>1</edge_type>
          <source_obj>10</source_obj>
          <sink_obj>12</sink_obj>
          <is_back_edge>0</is_back_edge>
        </item>
        <item class_id_reference="20" object_id="_17">
          <id>24</id>
          <edge_type>1</edge_type>
          <source_obj>2</source_obj>
          <sink_obj>12</sink_obj>
          <is_back_edge>0</is_back_edge>
        </item>
        <item class_id_reference="20" object_id="_18">
          <id>102</id>
          <edge_type>4</edge_type>
          <source_obj>11</source_obj>
          <sink_obj>12</sink_obj>
          <is_back_edge>0</is_back_edge>
        </item>
        <item class_id_reference="20" object_id="_19">
          <id>103</id>
          <edge_type>4</edge_type>
          <source_obj>11</source_obj>
          <sink_obj>12</sink_obj>
          <is_back_edge>0</is_back_edge>
        </item>
      </edges>
    </cdfg>
    <cdfg_regions class_id="21" tracking_level="0" version="0">
      <count>1</count>
      <item_version>0</item_version>
      <item class_id="22" tracking_level="1" version="0" object_id="_20">
        <mId>1</mId>
        <mTag>accelerator</mTag>
        <mNormTag>accelerator</mNormTag>
        <mType>0</mType>
        <sub_regions>
          <count>0</count>
          <item_version>0</item_version>
        </sub_regions>
        <basic_blocks>
          <count>1</count>
          <item_version>0</item_version>
          <item>14</item>
        </basic_blocks>
        <mII>-1</mII>
        <mDepth>-1</mDepth>
        <mMinTripCount>-1</mMinTripCount>
        <mMaxTripCount>-1</mMaxTripCount>
        <mMinLatency>1158</mMinLatency>
        <mMaxLatency>1158</mMaxLatency>
        <mIsDfPipe>1</mIsDfPipe>
        <mDfPipe class_id="23" tracking_level="1" version="0" object_id="_21">
          <port_list class_id="24" tracking_level="0" version="0">
            <count>2</count>
            <item_version>0</item_version>
            <item class_id="25" tracking_level="1" version="0" object_id="_22">
              <name>In_r</name>
              <dir>0</dir>
              <type>0</type>
              <need_hs>0</need_hs>
              <top_port class_id="-1"/>
              <chan class_id="-1"/>
            </item>
            <item class_id_reference="25" object_id="_23">
              <name>Out_r</name>
              <dir>1</dir>
              <type>0</type>
              <need_hs>0</need_hs>
              <top_port class_id="-1"/>
              <chan class_id="-1"/>
            </item>
          </port_list>
          <process_list class_id="27" tracking_level="0" version="0">
            <count>2</count>
            <item_version>0</item_version>
            <item class_id="28" tracking_level="1" version="0" object_id="_24">
              <type>0</type>
              <name>count_U0</name>
              <ssdmobj_id>11</ssdmobj_id>
              <pins class_id="29" tracking_level="0" version="0">
                <count>1</count>
                <item_version>0</item_version>
                <item class_id="30" tracking_level="1" version="0" object_id="_25">
                  <port class_id_reference="25" object_id="_26">
                    <name>In_r</name>
                    <dir>0</dir>
                    <type>0</type>
                    <need_hs>0</need_hs>
                    <top_port class_id_reference="25" object_id_reference="_22"/>
                    <chan class_id="-1"/>
                  </port>
                  <inst class_id="31" tracking_level="1" version="0" object_id="_27">
                    <type>0</type>
                    <name>count_U0</name>
                    <ssdmobj_id>11</ssdmobj_id>
                  </inst>
                </item>
              </pins>
              <in_source_fork>1</in_source_fork>
              <in_sink_join>0</in_sink_join>
              <flag_in_gui>0</flag_in_gui>
            </item>
            <item class_id_reference="28" object_id="_28">
              <type>0</type>
              <name>threshold_U0</name>
              <ssdmobj_id>12</ssdmobj_id>
              <pins>
                <count>1</count>
                <item_version>0</item_version>
                <item class_id_reference="30" object_id="_29">
                  <port class_id_reference="25" object_id="_30">
                    <name>Out_r</name>
                    <dir>1</dir>
                    <type>0</type>
                    <need_hs>0</need_hs>
                    <top_port class_id_reference="25" object_id_reference="_23"/>
                    <chan class_id="-1"/>
                  </port>
                  <inst class_id_reference="31" object_id="_31">
                    <type>0</type>
                    <name>threshold_U0</name>
                    <ssdmobj_id>12</ssdmobj_id>
                  </inst>
                </item>
              </pins>
              <in_source_fork>0</in_source_fork>
              <in_sink_join>1</in_sink_join>
              <flag_in_gui>0</flag_in_gui>
            </item>
          </process_list>
          <channel_list class_id="32" tracking_level="0" version="0">
            <count>1</count>
            <item_version>0</item_version>
            <item class_id="26" tracking_level="1" version="0" object_id="_32">
              <type>1</type>
              <name>appear</name>
              <ssdmobj_id>10</ssdmobj_id>
              <ctype>1</ctype>
              <depth>0</depth>
              <bitwidth>0</bitwidth>
              <suggested_type>0</suggested_type>
              <suggested_depth>2</suggested_depth>
              <source_list>
                <count>1</count>
                <item_version>0</item_version>
                <item class_id_reference="30" object_id="_33">
                  <port class_id_reference="25" object_id="_34">
                    <name>in</name>
                    <dir>0</dir>
                    <type>3</type>
                    <need_hs>0</need_hs>
                    <top_port class_id="-1"/>
                    <chan class_id="-1"/>
                  </port>
                  <inst class_id_reference="31" object_id_reference="_27"/>
                </item>
              </source_list>
              <sink_list>
                <count>1</count>
                <item_version>0</item_version>
                <item class_id_reference="30" object_id="_35">
                  <port class_id_reference="25" object_id="_36">
                    <name>out</name>
                    <dir>1</dir>
                    <type>3</type>
                    <need_hs>0</need_hs>
                    <top_port class_id="-1"/>
                    <chan class_id="-1"/>
                  </port>
                  <inst class_id_reference="31" object_id_reference="_31"/>
                </item>
              </sink_list>
            </item>
          </channel_list>
          <net_list class_id="33" tracking_level="0" version="0">
            <count>0</count>
            <item_version>0</item_version>
          </net_list>
        </mDfPipe>
      </item>
    </cdfg_regions>
    <fsm class_id="34" tracking_level="1" version="0" object_id="_37">
      <states class_id="35" tracking_level="0" version="0">
        <count>4</count>
        <item_version>0</item_version>
        <item class_id="36" tracking_level="1" version="0" object_id="_38">
          <id>1</id>
          <operations class_id="37" tracking_level="0" version="0">
            <count>2</count>
            <item_version>0</item_version>
            <item class_id="38" tracking_level="1" version="0" object_id="_39">
              <id>10</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
            <item class_id_reference="38" object_id="_40">
              <id>11</id>
              <stage>2</stage>
              <latency>2</latency>
            </item>
          </operations>
        </item>
        <item class_id_reference="36" object_id="_41">
          <id>2</id>
          <operations>
            <count>1</count>
            <item_version>0</item_version>
            <item class_id_reference="38" object_id="_42">
              <id>11</id>
              <stage>1</stage>
              <latency>2</latency>
            </item>
          </operations>
        </item>
        <item class_id_reference="36" object_id="_43">
          <id>3</id>
          <operations>
            <count>1</count>
            <item_version>0</item_version>
            <item class_id_reference="38" object_id="_44">
              <id>12</id>
              <stage>2</stage>
              <latency>2</latency>
            </item>
          </operations>
        </item>
        <item class_id_reference="36" object_id="_45">
          <id>4</id>
          <operations>
            <count>9</count>
            <item_version>0</item_version>
            <item class_id_reference="38" object_id="_46">
              <id>3</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
            <item class_id_reference="38" object_id="_47">
              <id>4</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
            <item class_id_reference="38" object_id="_48">
              <id>5</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
            <item class_id_reference="38" object_id="_49">
              <id>6</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
            <item class_id_reference="38" object_id="_50">
              <id>7</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
            <item class_id_reference="38" object_id="_51">
              <id>8</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
            <item class_id_reference="38" object_id="_52">
              <id>9</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
            <item class_id_reference="38" object_id="_53">
              <id>12</id>
              <stage>1</stage>
              <latency>2</latency>
            </item>
            <item class_id_reference="38" object_id="_54">
              <id>13</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
          </operations>
        </item>
      </states>
      <transitions class_id="39" tracking_level="0" version="0">
        <count>3</count>
        <item_version>0</item_version>
        <item class_id="40" tracking_level="1" version="0" object_id="_55">
          <inState>1</inState>
          <outState>2</outState>
          <condition class_id="41" tracking_level="0" version="0">
            <id>-1</id>
            <sop class_id="42" tracking_level="0" version="0">
              <count>1</count>
              <item_version>0</item_version>
              <item class_id="43" tracking_level="0" version="0">
                <count>0</count>
                <item_version>0</item_version>
              </item>
            </sop>
          </condition>
        </item>
        <item class_id_reference="40" object_id="_56">
          <inState>2</inState>
          <outState>3</outState>
          <condition>
            <id>-1</id>
            <sop>
              <count>1</count>
              <item_version>0</item_version>
              <item>
                <count>0</count>
                <item_version>0</item_version>
              </item>
            </sop>
          </condition>
        </item>
        <item class_id_reference="40" object_id="_57">
          <inState>3</inState>
          <outState>4</outState>
          <condition>
            <id>-1</id>
            <sop>
              <count>1</count>
              <item_version>0</item_version>
              <item>
                <count>0</count>
                <item_version>0</item_version>
              </item>
            </sop>
          </condition>
        </item>
      </transitions>
    </fsm>
    <res class_id="44" tracking_level="1" version="0" object_id="_58">
      <dp_component_resource class_id="45" tracking_level="0" version="0">
        <count>2</count>
        <item_version>0</item_version>
        <item class_id="46" tracking_level="0" version="0">
          <first>count_U0 (count)</first>
          <second class_id="47" tracking_level="0" version="0">
            <count>2</count>
            <item_version>0</item_version>
            <item class_id="48" tracking_level="0" version="0">
              <first>FF</first>
              <second>180</second>
            </item>
            <item>
              <first>LUT</first>
              <second>2325</second>
            </item>
          </second>
        </item>
        <item>
          <first>threshold_U0 (threshold)</first>
          <second>
            <count>2</count>
            <item_version>0</item_version>
            <item>
              <first>FF</first>
              <second>49</second>
            </item>
            <item>
              <first>LUT</first>
              <second>194</second>
            </item>
          </second>
        </item>
      </dp_component_resource>
      <dp_expression_resource>
        <count>1</count>
        <item_version>0</item_version>
        <item>
          <first>ap_idle ( and ) </first>
          <second>
            <count>4</count>
            <item_version>0</item_version>
            <item>
              <first>(0P0)</first>
              <second>1</second>
            </item>
            <item>
              <first>(1P1)</first>
              <second>1</second>
            </item>
            <item>
              <first>FF</first>
              <second>0</second>
            </item>
            <item>
              <first>LUT</first>
              <second>2</second>
            </item>
          </second>
        </item>
      </dp_expression_resource>
      <dp_fifo_resource>
        <count>0</count>
        <item_version>0</item_version>
      </dp_fifo_resource>
      <dp_memory_resource>
        <count>1</count>
        <item_version>0</item_version>
        <item>
          <first>appear_U</first>
          <second>
            <count>8</count>
            <item_version>0</item_version>
            <item>
              <first>(0Words)</first>
              <second>256</second>
            </item>
            <item>
              <first>(1Bits)</first>
              <second>8</second>
            </item>
            <item>
              <first>(2Banks)</first>
              <second>1</second>
            </item>
            <item>
              <first>(3W*Bits*Banks)</first>
              <second>2048</second>
            </item>
            <item>
              <first>BRAM</first>
              <second>2</second>
            </item>
            <item>
              <first>FF</first>
              <second>0</second>
            </item>
            <item>
              <first>LUT</first>
              <second>0</second>
            </item>
            <item>
              <first>URAM</first>
              <second>0</second>
            </item>
          </second>
        </item>
      </dp_memory_resource>
      <dp_multiplexer_resource>
        <count>0</count>
        <item_version>0</item_version>
      </dp_multiplexer_resource>
      <dp_register_resource>
        <count>0</count>
        <item_version>0</item_version>
      </dp_register_resource>
      <dp_dsp_resource>
        <count>2</count>
        <item_version>0</item_version>
        <item>
          <first>count_U0</first>
          <second>
            <count>0</count>
            <item_version>0</item_version>
          </second>
        </item>
        <item>
          <first>threshold_U0</first>
          <second>
            <count>0</count>
            <item_version>0</item_version>
          </second>
        </item>
      </dp_dsp_resource>
      <dp_component_map class_id="49" tracking_level="0" version="0">
        <count>2</count>
        <item_version>0</item_version>
        <item class_id="50" tracking_level="0" version="0">
          <first>count_U0 (count)</first>
          <second>
            <count>1</count>
            <item_version>0</item_version>
            <item>11</item>
          </second>
        </item>
        <item>
          <first>threshold_U0 (threshold)</first>
          <second>
            <count>1</count>
            <item_version>0</item_version>
            <item>12</item>
          </second>
        </item>
      </dp_component_map>
      <dp_expression_map>
        <count>0</count>
        <item_version>0</item_version>
      </dp_expression_map>
      <dp_fifo_map>
        <count>0</count>
        <item_version>0</item_version>
      </dp_fifo_map>
      <dp_memory_map>
        <count>1</count>
        <item_version>0</item_version>
        <item>
          <first>appear_U</first>
          <second>
            <count>1</count>
            <item_version>0</item_version>
            <item>1</item>
          </second>
        </item>
      </dp_memory_map>
    </res>
    <node_label_latency class_id="51" tracking_level="0" version="0">
      <count>4</count>
      <item_version>0</item_version>
      <item class_id="52" tracking_level="0" version="0">
        <first>10</first>
        <second class_id="53" tracking_level="0" version="0">
          <first>0</first>
          <second>0</second>
        </second>
      </item>
      <item>
        <first>11</first>
        <second>
          <first>0</first>
          <second>1</second>
        </second>
      </item>
      <item>
        <first>12</first>
        <second>
          <first>2</first>
          <second>1</second>
        </second>
      </item>
      <item>
        <first>13</first>
        <second>
          <first>3</first>
          <second>0</second>
        </second>
      </item>
    </node_label_latency>
    <bblk_ent_exit class_id="54" tracking_level="0" version="0">
      <count>1</count>
      <item_version>0</item_version>
      <item class_id="55" tracking_level="0" version="0">
        <first>14</first>
        <second class_id="56" tracking_level="0" version="0">
          <first>0</first>
          <second>3</second>
        </second>
      </item>
    </bblk_ent_exit>
    <regions class_id="57" tracking_level="0" version="0">
      <count>1</count>
      <item_version>0</item_version>
      <item class_id="58" tracking_level="1" version="0" object_id="_59">
        <region_name>accelerator</region_name>
        <basic_blocks>
          <count>1</count>
          <item_version>0</item_version>
          <item>14</item>
        </basic_blocks>
        <nodes>
          <count>11</count>
          <item_version>0</item_version>
          <item>3</item>
          <item>4</item>
          <item>5</item>
          <item>6</item>
          <item>7</item>
          <item>8</item>
          <item>9</item>
          <item>10</item>
          <item>11</item>
          <item>12</item>
          <item>13</item>
        </nodes>
        <anchor_node>-1</anchor_node>
        <region_type>16</region_type>
        <interval>0</interval>
        <pipe_depth>0</pipe_depth>
        <mDBIIViolationVec class_id="59" tracking_level="0" version="0">
          <count>0</count>
          <item_version>0</item_version>
        </mDBIIViolationVec>
      </item>
    </regions>
    <dp_fu_nodes class_id="60" tracking_level="0" version="0">
      <count>3</count>
      <item_version>0</item_version>
      <item class_id="61" tracking_level="0" version="0">
        <first>30</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>10</item>
        </second>
      </item>
      <item>
        <first>34</first>
        <second>
          <count>2</count>
          <item_version>0</item_version>
          <item>11</item>
          <item>11</item>
        </second>
      </item>
      <item>
        <first>42</first>
        <second>
          <count>2</count>
          <item_version>0</item_version>
          <item>12</item>
          <item>12</item>
        </second>
      </item>
    </dp_fu_nodes>
    <dp_fu_nodes_expression class_id="63" tracking_level="0" version="0">
      <count>1</count>
      <item_version>0</item_version>
      <item class_id="64" tracking_level="0" version="0">
        <first>appear_alloca_fu_30</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>10</item>
        </second>
      </item>
    </dp_fu_nodes_expression>
    <dp_fu_nodes_module>
      <count>2</count>
      <item_version>0</item_version>
      <item>
        <first>grp_count_fu_34</first>
        <second>
          <count>2</count>
          <item_version>0</item_version>
          <item>11</item>
          <item>11</item>
        </second>
      </item>
      <item>
        <first>grp_threshold_fu_42</first>
        <second>
          <count>2</count>
          <item_version>0</item_version>
          <item>12</item>
          <item>12</item>
        </second>
      </item>
    </dp_fu_nodes_module>
    <dp_fu_nodes_io>
      <count>0</count>
      <item_version>0</item_version>
    </dp_fu_nodes_io>
    <return_ports>
      <count>0</count>
      <item_version>0</item_version>
    </return_ports>
    <dp_mem_port_nodes class_id="65" tracking_level="0" version="0">
      <count>0</count>
      <item_version>0</item_version>
    </dp_mem_port_nodes>
    <dp_reg_nodes>
      <count>0</count>
      <item_version>0</item_version>
    </dp_reg_nodes>
    <dp_regname_nodes>
      <count>0</count>
      <item_version>0</item_version>
    </dp_regname_nodes>
    <dp_reg_phi>
      <count>0</count>
      <item_version>0</item_version>
    </dp_reg_phi>
    <dp_regname_phi>
      <count>0</count>
      <item_version>0</item_version>
    </dp_regname_phi>
    <dp_port_io_nodes class_id="66" tracking_level="0" version="0">
      <count>2</count>
      <item_version>0</item_version>
      <item class_id="67" tracking_level="0" version="0">
        <first>In_r</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>
            <first>call</first>
            <second>
              <count>1</count>
              <item_version>0</item_version>
              <item>11</item>
            </second>
          </item>
        </second>
      </item>
      <item>
        <first>Out_r</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>
            <first>call</first>
            <second>
              <count>1</count>
              <item_version>0</item_version>
              <item>12</item>
            </second>
          </item>
        </second>
      </item>
    </dp_port_io_nodes>
    <port2core>
      <count>0</count>
      <item_version>0</item_version>
    </port2core>
    <node2core>
      <count>3</count>
      <item_version>0</item_version>
      <item>
        <first>10</first>
        <second>
          <first>666</first>
          <second>136</second>
        </second>
      </item>
      <item>
        <first>11</first>
        <second>
          <first>-1</first>
          <second>-1</second>
        </second>
      </item>
      <item>
        <first>12</first>
        <second>
          <first>-1</first>
          <second>-1</second>
        </second>
      </item>
    </node2core>
  </syndb>
</boost_serialization>
