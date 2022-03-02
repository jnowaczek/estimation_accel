<project xmlns="com.autoesl.autopilot.project" name="estimation" top="byte_count">
    <includePaths/>
    <libraryPaths/>
    <Simulation>
        <SimFlow name="csim" csimMode="0" lastCsimMode="0"/>
    </Simulation>
    <files xmlns="">
        <file name="../../byte_count_bench.cpp" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="../../../shared/byte_count_gold/byte_count_gold.hpp" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="../../tb_data" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="byte_count.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="byte_count.hpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="../shared/byte_count_gold/byte_count_types.hpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
    </files>
    <solutions xmlns="">
        <solution name="byte_count" status="active"/>
    </solutions>
</project>

