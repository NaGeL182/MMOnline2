# => Monty_The_Snek's custom ruby Debugging I/O library
# => *
# => Initialize this with debug.new Arguments accepted: a boolean value for verbose or not.
# => *
# => USAGE
# => Before you can use this library for debugging purposes, you first need to initialize the class by using DEBUG.new(argument)
# => The argument supplied must be a boolean value. True will enable verbose output, false will disable it.
# => To cause console output, simply use DEBUG.cout(args)
# => There are 4 total arguments that can be passed to this.
# => Console output -> Arguments are message to be displayed, Message Severity(integer 0-1), and whether or not that particular message should be verbose-only.

class DEBUG
    def initialize(verbose)
        @@verbose = verbose
        puts verbose?
    end

    #Tell console if verbose mode is on or not
    def verbose?
        if @@verbose == true
            return "Verbose output to console has been enabled."
        elsif @@verbose == false
            return "Verbose output to console has not been enabled"
        end

    end

    #Console output -> Arguments are message, Message Severity(integer), and whether or not that particular message should be verbose-only
    def self.cout(msg, msgType = "Message", isVerbose = false)
        msgType = msgType.to_i
        case msgType
        when 0
            msgType = "Message"
        when 1
            msgType = "Warning"
        when 2
            msgType = "Error"
        when 4
            msgType = "FATAL_ERROR"
        else
            msgType = "UNDEFINED"
        end
        if (( @@verbose == true ) && ( isVerbose == true )) or isVerbose == false
            puts "[ " + Time.now.to_s + "]" + "[#{msgType}]: " + "#{msg}"
        else
            return ""
        end
    end
end
