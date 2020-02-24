

Describe  "Test 'test-me' function" {

    Context 'Checking if providing a number to the function returns the number+1' {

        It 'Testing num 5 returns 6' {
            test-me -num 5 | Should be 6
        }

    }
}

Describe  "Common tests" {

    Context 'Test that will always fail' {

        It 'True is False' {
            $true | Should be $false
        }

    }
}
