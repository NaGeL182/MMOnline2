# Monty_The_Snek's custom ruby Debugging I/O library

#Initialize this with debug.new Arguments accepted: a boolean value for verbose or not.

class DEBUG
    def initialize(verbose)
        @@verbose = verbose
        puts verbose?
    end

    #Tell console if verbose or not
    def verbose?
        if @@verbose = true
            return "Verbose output to console has been enabled."
        else
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
        if @@verbose && isVerbose == true
            puts "[ " + Time.now + "]" + "[#{msgType}]: " + "#{msg}"
        elsif @@verbose && isVerbose == false
            puts "[ " + Time.now.to_s + "]" + "[#{msgType}]: " + "#{msg}"
        else
            return nil
        end
    end
end
