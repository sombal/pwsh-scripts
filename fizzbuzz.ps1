Param(
    [Parameter(ValueFromPipeline = $true)]
    [int]$Number
)
Begin {
    $Fizz = "Fizz"
    $Buzz = "Buzz"
    $Both = "FizzBuzz"
}
Process {
    # For each item from the Pipeline or from $Number
    $result = switch ($Number) {
        # Is the current number a multiple of 3
        {$_ % 3 -eq 0} {
            $Fizz
        }
        # Is the current number a multiple of 5
        {$_ % 5 -eq 0} {
            $Buzz
        }
        # Is the current number NOT a multiple of 3 or 5
        default {
            $_
        }
    }
    # Is the current number a multiple of 3 and 5
    If ($result -is [array]) {
        $result = $Both
    }
    # Output the current number, Fizz, Buzz, or FizzBuzz
    $result
}