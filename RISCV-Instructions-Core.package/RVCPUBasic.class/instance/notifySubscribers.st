as yet unclassified
notifySubscribers
	"Send the #changed message to any registered subscribers"
	subscribers do: [ :subscriber | subscriber updated ]