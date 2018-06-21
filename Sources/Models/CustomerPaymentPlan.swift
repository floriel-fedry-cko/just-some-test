import Foundation

public class CustomerPaymentPlan: Codable {

    public var autoCapTime: String?

    public var cardId: String?

    public var currency: String?

    public var currentRecurringStatus: Int?

    public var customerId: String?

    public var customerPlanId: String?

    public var cycle: String?

    public var id: String?

    public var name: String?

    public var nextRecurringDate: String?

    public var planTrackId: String?

    public var previousRecurringDate: String?

    public var recurringCount: Int?

    public var recurringCountLeft: Int?

    public var startDate: String?

    public var totalCollectedCount: Int?

    public var totalCollectedValue: Int?

    public var value: Int?

    public init(autoCapTime: String? = nil, cardId: String? = nil, currency: String? = nil, currentRecurringStatus: Int? = nil, customerId: String? = nil, customerPlanId: String? = nil, cycle: String? = nil, id: String? = nil, name: String? = nil, nextRecurringDate: String? = nil, planTrackId: String? = nil, previousRecurringDate: String? = nil, recurringCount: Int? = nil, recurringCountLeft: Int? = nil, startDate: String? = nil, totalCollectedCount: Int? = nil, totalCollectedValue: Int? = nil, value: Int? = nil) {
        self.autoCapTime = autoCapTime
        self.cardId = cardId
        self.currency = currency
        self.currentRecurringStatus = currentRecurringStatus
        self.customerId = customerId
        self.customerPlanId = customerPlanId
        self.cycle = cycle
        self.id = id
        self.name = name
        self.nextRecurringDate = nextRecurringDate
        self.planTrackId = planTrackId
        self.previousRecurringDate = previousRecurringDate
        self.recurringCount = recurringCount
        self.recurringCountLeft = recurringCountLeft
        self.startDate = startDate
        self.totalCollectedCount = totalCollectedCount
        self.totalCollectedValue = totalCollectedValue
        self.value = value
    }

}
