
gci -Path .\
function test-me {
    param (
        $num
    )
    return $num+1
}