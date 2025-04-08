// ignore_for_file: constant_identifier_names

enum Gender { male, female }

enum ResendOtpType { verify_email, reset_password }

enum VerificationTypes { register, reset_password }

enum SuccessType { verifyEmail, resetPassword, changePassword, createOrder }

enum PaymentMethods { cash, online }

enum SubscriptionType {
  monthly,
  yearly,
  weekly,
  daily,
  custom,
  halfYearly,
  quarterly,
}

enum PlanType { basic, premium, enterprise, professional }

PlanType getPlanTypeFromString(String type) {
  switch (type) {
    case 'basic':
      return PlanType.basic;
    case 'premium':
      return PlanType.premium;
    case 'enterprise':
      return PlanType.enterprise;
    case 'professional':
      return PlanType.professional;
    default:
      throw Exception('Unknown plan type: $type');
  }
}

SubscriptionType getSubscriptionTypeFromString(String type) {
  switch (type) {
    case 'monthly':
      return SubscriptionType.monthly;
    case 'yearly':
      return SubscriptionType.yearly;
    case 'weekly':
      return SubscriptionType.weekly;
    case 'daily':
      return SubscriptionType.daily;
    case 'custom':
      return SubscriptionType.custom;
    case 'halfYearly':
      return SubscriptionType.halfYearly;
    case 'quarterly':
      return SubscriptionType.quarterly;
    default:
      throw Exception('Unknown subscription type: $type');
  }
}

enum PlanTarget { individual, company }

PlanTarget getPlanTargetFromString(String type) {
  switch (type) {
    case 'individual':
      return PlanTarget.individual;
    case 'company':
      return PlanTarget.company;
    default:
      throw Exception('Unknown plan target: $type');
  }
}

enum SubscriptionStatus { free, paid }

SubscriptionStatus getSubscriptionStatusFromString(String status) {
  switch (status) {
    case 'free':
      return SubscriptionStatus.free;
    case 'paid':
      return SubscriptionStatus.paid;
    default:
      throw Exception('Unknown subscription status: $status');
  }
}

