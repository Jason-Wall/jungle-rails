describe('product_details', () => {
  beforeEach(() => {
    cy.visit('localhost:3000');
    cy.get(".products article")
      .first()
      .click();
  });


  it('Loads the selected item', () => {
    cy.get(".product-detail").should("be.visible");
  });

}
);