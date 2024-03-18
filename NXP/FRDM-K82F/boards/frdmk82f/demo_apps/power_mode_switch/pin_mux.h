/*
 * Copyright 2019 NXP
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

/***********************************************************************************************************************
 * This file was generated by the MCUXpresso Config Tools. Any manual edits made to this file
 * will be overwritten if the respective MCUXpresso Config Tools is used to update this file.
 **********************************************************************************************************************/

#ifndef _PIN_MUX_H_
#define _PIN_MUX_H_

/*!
 * @addtogroup pin_mux
 * @{
 */

/***********************************************************************************************************************
 * API
 **********************************************************************************************************************/

#if defined(__cplusplus)
extern "C" {
#endif

/*!
 * @brief Calls initialization functions.
 *
 */
void BOARD_InitBootPins(void);

/*! @name PORTC14 (number 86), OpenSDA_UART
  @{ */
#define BOARD_DEBUG_UART_RX_PORT PORTC /*!<@brief PORT device name: PORTC */
#define BOARD_DEBUG_UART_RX_PIN 14U    /*!<@brief PORTC pin index: 14 */
                                       /* @} */

/*! @name PORTC15 (number 87), OpenSDA_UART
  @{ */
#define BOARD_DEBUG_UART_TX_PORT PORTC /*!<@brief PORT device name: PORTC */
#define BOARD_DEBUG_UART_TX_PIN 15U    /*!<@brief PORTC pin index: 15 */
                                       /* @} */

/*! @name PORTC6 (number 78), SW3
  @{ */
#define BOARD_SW3_GPIO GPIOC /*!<@brief GPIO device name: GPIOC */
#define BOARD_SW3_PORT PORTC /*!<@brief PORT device name: PORTC */
#define BOARD_SW3_PIN 6U     /*!<@brief PORTC pin index: 6 */
                             /* @} */

/*! @name PORTA2 (number 38), J2[20]J12[3]/J19[6]/U6[4]/I2C_SCL
  @{ */
#define BOARD_I2C_SCL_PORT PORTA /*!<@brief PORT device name: PORTA */
#define BOARD_I2C_SCL_PIN 2U     /*!<@brief PORTA pin index: 2 */
                                 /* @} */

/*!
 * @brief Configures pin routing and optionally pin electrical features.
 *
 */
void BOARD_InitPins(void);

#if defined(__cplusplus)
}
#endif

/*!
 * @}
 */
#endif /* _PIN_MUX_H_ */

/***********************************************************************************************************************
 * EOF
 **********************************************************************************************************************/