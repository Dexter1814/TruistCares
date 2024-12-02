### **Software Requirements Specification (SRS) for TruistCares Platform**

---

### **1. Introduction**

#### **1.1 Purpose**
The purpose of this document is to define the functional and non-functional requirements for the **TruistCares Platform**, a web application designed to facilitate secure donations to vetted charitable organizations, including Historically Black Colleges and Universities (HBCUs). The platform ensures data security, high availability, and seamless user experiences for both donors and organizations.

#### **1.2 Project Scope**
The **TruistCares Platform** aims to:
- Enable users to make secure one-time and recurring donations to charitable organizations.
- Provide validation of charitable organizations using a third-party vetting API to ensure they meet Truist’s ethical and security standards.
- Offer high availability and robust performance, leveraging Azure’s infrastructure and built-in security protocols.
- Ensure seamless donation processing with minimal downtime to meet the operational expectations of Truist’s leadership.

#### **1.3 Definitions, Acronyms, and Abbreviations**
- **HBCUs**: Historically Black Colleges and Universities.
- **MFA**: Multi-Factor Authentication.
- **API**: Application Programming Interface.
- **CI/CD**: Continuous Integration and Continuous Deployment.
- **SQL**: Structured Query Language.

---

### **2. Stakeholders and User Personas**

#### **2.1 Stakeholders**
- **End Users**: Donors contributing to charitable organizations and accessing their donation history.
- **Charitable Organizations**: Recipients of donations that are verified to meet ethical standards.
- **Truist Foundation**: Sponsor ensuring platform integrity, security, and reliability.
- **Truist Leadership**: Concerned with operational uptime and security compliance.

#### **2.2 User Personas**
- **Registered Donors**: Individuals making donations, managing their profiles, and tracking contributions.
- **Administrators**: Users with access to manage platform data, including organizations and campaigns.

---

### **3. Functional Requirements**

#### **3.1 User Registration and Authentication**
- Users must be able to register and log in securely using email and password with Multi-Factor Authentication (MFA).
- Password resets must be handled securely through email verification.

#### **3.2 Donation Management**
- Support one-time and recurring donations to selected charitable organizations.
- Enable users to set donation schedules and manage recurring transactions.

#### **3.3 Organization Validation**
- Integrate a third-party vetting API to validate charitable organizations during registration.
  - Ensure the organization is legitimate, compliant with regulations, and not affiliated with hate or terrorist groups.
  - Log the validation results for audit and transparency purposes.

#### **3.4 Reporting and Donation History**
- Users must be able to view their donation history, download receipts, and generate reports for tax purposes.
- Provide receipt IDs for each transaction to simplify audit trails.

---

### **4. Non-Functional Requirements**

#### **4.1 Security**
- Integrate Truist’s purchased third-party API to validate organizations and ensure ethical compliance.
- Leverage Azure’s security features:
  - **Data Encryption**: Encrypt data in transit (HTTPS) and at rest (Transparent Data Encryption for Azure SQL).
  - **Azure Key Vault**: Store secrets, API keys, and sensitive information securely.
  - **Built-in Compliance**: Ensure adherence to industry standards like PCI DSS for payment processing.

#### **4.2 Availability and Reliability**
- The platform must achieve **99.99% uptime**, leveraging Azure’s availability zones and geo-redundancy.
- Implement **auto-scaling** to handle traffic spikes during donation drives.
- Utilize Azure’s **Application Insights** for monitoring real-time performance and diagnosing issues proactively.

#### **4.3 Performance**
- Transactions must complete in less than 3 seconds under normal load conditions.
- The system must scale to handle 10,000 simultaneous users during high-demand events.

---

### **5. System Uptime and Transaction Assurance**
To address concerns about operational reliability:
- **High Availability**:
  - Deploy the platform across multiple Azure availability zones.
  - Use Azure Load Balancer to ensure failover in case of infrastructure issues.
- **Monitoring and Alerting**:
  - Set up Azure Monitor and Application Insights to detect anomalies, transaction failures, and performance issues.
  - Configure real-time alerts to notify the operations team of potential downtimes.
- **Fallback and Retry Logic**:
  - Implement retry mechanisms in the payment processing flow to handle transient errors without user intervention.
  - Provide an offline backup notification system for critical issues, allowing the operations team to respond before users are impacted.

---

### **6. User Stories**

#### **6.1 Core User Stories**
1. **As a user**, I want to register and log in securely so that I can manage my donations.
2. **As a user**, I want to set up recurring donations to support my chosen organizations consistently.
3. **As a user**, I want to view and download my donation history for tax purposes.

#### **6.2 Administrative Stories**
1. **As an administrator**, I want to validate organizations using the third-party API so that only compliant entities are added to the platform.
2. **As an administrator**, I want to monitor donation activity and generate reports for stakeholders.

---

### **7. Appendix**

#### **References**
1. **Azure Security Documentation**: [Azure Security Overview](https://learn.microsoft.com/en-us/azure/security/)
2. **Third-Party Vetting API**: Documentation to be provided by Truist.
3. **Azure Application Insights**: [Monitoring with Application Insights](https://learn.microsoft.com/en-us/azure/azure-monitor/app/app-insights-overview)
4. **Azure Load Balancer**: [High Availability with Azure Load Balancer](https://learn.microsoft.com/en-us/azure/load-balancer/load-balancer-overview)

---

### **Key Additions Based on Feedback**
1. **Third-Party API for Organization Validation**: Ensures the inclusion of only legitimate, compliant organizations.
2. **Built-In Azure Security**: Highlights Azure's encryption, compliance, and monitoring capabilities to reassure stakeholders.
3. **System Uptime Assurance**: Defines strategies for high availability, proactive monitoring, and fallback mechanisms to minimize disruptions.

---

